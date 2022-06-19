import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final dynamic toJoke;
  final Color curColor;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;

  const InfoScreen(this.toJoke, this.curColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: curColor,
          title: const Center(
            child: SafeArea(
                minimum: EdgeInsets.fromLTRB(zero, 40, zero, 60),
                child: Text('Developer info')),
          ),
        ),
        body: Column(
          children: const [
            Image(
              image: AssetImage(
                'assets/chuck1.png',
              ),
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
