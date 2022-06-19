import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'fetches.dart';

class FavScreen extends StatelessWidget {
  final dynamic toJoke;
  final Color curColor;
  static const double big = 30;
  static const double middle = 20;
  static const double small = 10;
  static const double zero = 0.0;
  final List<Widget> conv = fetchlocalJokes();

  FavScreen(this.toJoke, this.curColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot?> jokeDoc = FirebaseFirestore.instance
        .collection('hime')
        .doc('VA4xNDZLN0YYpDi7L8oW')
        .get();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: curColor,
          title: const Center(
            child: Text('Favourites'),
          ),
        ),
        body: FutureBuilder<DocumentSnapshot?>(
            future: jokeDoc,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView(
                  children: fetchlocalJokes(),
                );
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              conv.clear();
              conv.addAll(fetchCloudJokes(data['joke']));

              return ListView(
                children: conv,
              );
            }),
        floatingActionButton: Row(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, zero, 200, zero),
                child: FloatingActionButton(
                  backgroundColor: curColor,
                  onPressed: toJoke,
                  child: const Icon(Icons.arrow_back),
                ))
          ],
        ));
  }
}
