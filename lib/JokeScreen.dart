import 'package:flutter/material.dart';
import 'Joke.dart';
import 'brando.dart';
import 'dart:math';

class JokeScreen extends StatelessWidget {
  final toSettings;
  final toInfo;
  final toJoke;
  final Color cur_color;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;
  List<String> links = [];
  var random = new Random();

  JokeScreen(this.toSettings, this.toInfo, this.toJoke, this.cur_color) {
    links.add('assets/chuck1.png');
    links.add('assets/chuck2.png');
    links.add('assets/chuck3.png');
    links.add('assets/chuck4.png');
    links.add('assets/chuck5.png');
  }

  @override
  Widget build(BuildContext context) {
    Future<Joke?> humoreska = Data();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cur_color,
        title: const Center(
          child: SafeArea(
              child: Text(
                'Chuck Norris Facts',
              ),
              minimum: EdgeInsets.fromLTRB(10, 40, 80, 60)),
        ),
      ),
      drawer: SafeArea(
          child: Drawer(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(small, zero, zero, zero),
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
                            color: cur_color,
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
                              style: TextStyle(fontSize: big, color: cur_color),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: big,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: big,
                            color: cur_color,
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
                              style: TextStyle(fontSize: big, color: cur_color),
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
        SizedBox(
          height: 50,
        ),
        FutureBuilder<Joke?>(
            future: humoreska,
            builder: (context, snapshot) {
              if (snapshot.data?.value == null) {
                return const Text(
                  'loading...',
                  style: TextStyle(
                    fontSize: big,
                    fontFamily: 'roboto',
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: big),
                child: Text(
                  (snapshot.data?.value).toString(),
                  style: TextStyle(fontSize: middle),
                ),
              );
            }),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toJoke();
        },
        child: Icon(Icons.favorite),
        backgroundColor: cur_color,
      ),
    );
  }
}
