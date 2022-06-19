import 'package:flutter/material.dart';
import 'package:untitled/InfoScreen.dart';
import 'JokeScreen.dart';
import 'settings_screen.dart';
import 'favourites_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'fetches.dart';

late File myFile;
String content = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    fetchFile();
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static int val = 0;
  static Color style = Colors.blue;

  toSettings() {
    val = 1;
    setState(() {});
  }

  toJoke() {
    val = 0;
    setState(() {});
  }

  changeColor(Color color) {
    style = color;
    setState(() {});
  }

  toInfo() {
    val = 2;
    setState(() {});
  }

  toFav() {
    val = 3;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return requiredScreen(val);
  }

  Widget requiredScreen(int num) {
    if (num == 0) {
      return JokeScreen(
          toSettings, toInfo, toJoke, toFav, _MainScreenState.style);
    }
    if (num == 1) {
      return SettingsScreen(toJoke, changeColor, _MainScreenState.style);
    }
    if (num == 2) {
      return InfoScreen(toJoke, _MainScreenState.style);
    }
    if (num == 3) {
      return FavScreen(toJoke, _MainScreenState.style);
    }
    throw Exception("Undefined condition");
  }
}
