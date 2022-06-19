import 'package:flutter/material.dart';
import 'joke.dart';
import 'brando.dart';
import 'dart:math';
import 'main.dart';
import 'dart:async';
import 'updates.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class JokeScreen extends StatelessWidget {
  final dynamic toSettings;
  final dynamic toInfo;
  final dynamic toJoke;
  final dynamic toFav;
  final Color curColor;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;
  final List<String> links = [];

  final random = Random();

  JokeScreen(
      this.toSettings, this.toInfo, this.toJoke, this.toFav, this.curColor,
      {Key? key})
      : super(key: key) {
    for (int i = 1; i <= 5; i++) {
      links.add('assets/chuck$i.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<Joke?> humoreska = data();
    String curJoke = '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: curColor,
          title: const Center(
            child: SafeArea(
                minimum: EdgeInsets.fromLTRB(10, 40, 80, 60),
                child: Text(
                  'Chuck Norris Facts',
                )),
          ),
        ),
        drawer: SafeArea(
            child: Drawer(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(small, zero, zero, zero),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.add_reaction_outlined,
                              size: big,
                              color: curColor,
                            ),
                            const SizedBox(
                              width: middle,
                            ),
                            TextButton(
                              onPressed: () {
                                toInfo();
                              },
                              child: Text(
                                "Developer Info",
                                style:
                                    TextStyle(fontSize: big, color: curColor),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: big,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: big,
                              color: curColor,
                            ),
                            const SizedBox(
                              width: middle,
                            ),
                            TextButton(
                              onPressed: () {
                                toSettings();
                              },
                              child: Text(
                                "Settings",
                                style:
                                    TextStyle(fontSize: big, color: curColor),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: big,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_sharp,
                              size: big,
                              color: curColor,
                            ),
                            const SizedBox(
                              width: middle,
                            ),
                            TextButton(
                              onPressed: () async {
                                content = await myFile.readAsString();
                                toFav();
                              },
                              child: Text(
                                "Favourites",
                                style:
                                    TextStyle(fontSize: big, color: curColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    )))),
        body: Center(
            child: Column(children: [
          Image(
            height: 325,
            image: AssetImage(links[random.nextInt(links.length)]),
          ),
          const SizedBox(
            height: 50,
          ),
          FutureBuilder<bool>(
              future: InternetConnectionChecker().hasConnection,
              builder: (context, snapshot) {
                if (snapshot.data == false) {
                  return const Text(
                    'No internet connection...',
                    style: TextStyle(
                      fontSize: big,
                      fontFamily: 'roboto',
                    ),
                  );
                }
                return FutureBuilder<Joke?>(
                    future: humoreska,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          'loading...',
                          style: TextStyle(
                            fontSize: big,
                            fontFamily: 'roboto',
                          ),
                        );
                      }

                      curJoke = (snapshot.data?.value).toString();
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: big),
                        child: Text(
                          curJoke,
                          style: const TextStyle(fontSize: middle),
                        ),
                      );
                    });
              }),

        ])),
        floatingActionButton: Row(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(20, zero, zero, zero),
              child: FloatingActionButton(
                  backgroundColor: curColor,
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    if (curJoke.isNotEmpty) {
                      await updateLocal(curJoke);
                      await updateCloud(curJoke);
                      curJoke = '';
                    }
                  })),
          Padding(
              padding: const EdgeInsets.fromLTRB(250, zero, zero, zero),
              child: FloatingActionButton(
                onPressed: () {
                  toJoke();
                },
                backgroundColor: curColor,
                child: const Icon(Icons.favorite),
              )),
        ]));
  }
}
