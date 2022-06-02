import 'package:flutter/material.dart';
import 'main.dart';

class InfoScreen extends StatelessWidget {
  final toJoke;
  final Color cur_color;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;

  InfoScreen(this.toJoke, this.cur_color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cur_color,
          title: const Center(
            child: SafeArea(
                child: Text('Developer info'),
                minimum: EdgeInsets.fromLTRB(zero, 40, zero, 60)),
          ),
        ),
        body: Column(
          children: [
            Image(
              image: AssetImage('assets/chuck1.png', ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: big),
                child: Text(
                  'Hi! My name is Djhovidon Vakhidov. This app was made to get some points and survive summer simester. Hope you will enjoy it! Ah, yes, personal info... Well, my favourite drink is coffee',
                  style: TextStyle(fontSize: middle),
                )),
          ],
        ),
        floatingActionButton: Padding(
            padding: EdgeInsets.fromLTRB(zero, zero, 300, zero),
            child: FloatingActionButton(
              onPressed: () {
                toJoke();
              },
              child: Icon(Icons.arrow_back),
              backgroundColor: cur_color,
            )));
  }
}
