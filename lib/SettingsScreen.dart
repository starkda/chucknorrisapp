import 'package:flutter/material.dart';
import 'main.dart';

class SettingsScreen extends StatelessWidget {
  final changeColor;
  final toJoke;
  final Color cur_color;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;
  SettingsScreen(this.toJoke, this.changeColor, this.cur_color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cur_color,
          title: const Center(
            child: SafeArea(
                child: Text('Settings'),
                minimum: EdgeInsets.fromLTRB(zero, 40, zero, 60)),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(zero, zero, zero, zero),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Prefered Color',
                  style: TextStyle(color: cur_color, fontSize: big),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.square,
                      size: big,
                      color: Colors.blue,
                    ),
                    SizedBox(width: small),
                    TextButton(
                      onPressed: () {
                        changeColor(Colors.blue);
                      },
                      child: Text(
                        "Blue",
                        style: TextStyle(fontSize: big, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Icon(
                    Icons.square,
                    size: big,
                    color: Colors.red,
                  ),
                  SizedBox(width: small),
                  TextButton(
                    onPressed: () {
                      changeColor(Colors.red);
                    },
                    child: Text(
                      "Red",
                      style: TextStyle(fontSize: big, color: Colors.red),
                    ),
                  )
                ]),
                Row(children: [
                  Icon(
                    Icons.square,
                    size: big,
                    color: Colors.green,
                  ),
                  SizedBox(width: small),
                  TextButton(
                    onPressed: () {
                      changeColor(Colors.green);
                    },
                    child: Text(
                      "Green",
                      style: TextStyle(fontSize: big, color: Colors.green),
                    ),
                  )
                ])
              ],
            )),
        floatingActionButton: Padding(padding:EdgeInsets.fromLTRB(zero, zero, 300, zero), child:FloatingActionButton(
          onPressed: () {
            toJoke();
          },
          child:Icon(Icons.arrow_back),
          backgroundColor: cur_color,
        )));
  }
}
