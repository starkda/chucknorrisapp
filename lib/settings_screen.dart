import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final dynamic changeColor;
  final dynamic toJoke;
  final Color curColor;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;

  const SettingsScreen(this.toJoke, this.changeColor, this.curColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: curColor,
          title: const Center(
            child: SafeArea(
                minimum: EdgeInsets.fromLTRB(zero, 40, zero, 60),
                child: Text('Settings')),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(zero, zero, zero, zero),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Prefered Color',
                  style: TextStyle(color: curColor, fontSize: big),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.square,
                      size: big,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: small),
                    TextButton(
                      onPressed: () {
                        changeColor(Colors.blue);
                      },
                      child: const Text(
                        "Blue",
                        style: TextStyle(fontSize: big, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  const Icon(
                    Icons.square,
                    size: big,
                    color: Colors.red,
                  ),
                  const SizedBox(width: small),
                  TextButton(
                    onPressed: () {
                      changeColor(Colors.red);
                    },
                    child: const Text(
                      "Red",
                      style: TextStyle(fontSize: big, color: Colors.red),
                    ),
                  )
                ]),
                Row(children: [
                  const Icon(
                    Icons.square,
                    size: big,
                    color: Colors.green,
                  ),
                  const SizedBox(width: small),
                  TextButton(
                    onPressed: () {
                      changeColor(Colors.green);
                    },
                    child: const Text(
                      "Green",
                      style: TextStyle(fontSize: big, color: Colors.green),
                    ),
                  )
                ])
              ],
            )),
        floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(zero, zero, 300, zero),
            child: FloatingActionButton(
              onPressed: () {
                toJoke();
              },
              backgroundColor: curColor,
              child: const Icon(Icons.arrow_back),
            )));
  }
}
