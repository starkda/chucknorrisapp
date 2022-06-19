import 'main.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'updates.dart';

List<Widget> fetchlocalJokes(){
  List<Widget> conv = [];
  List<String> lines = content.split('\n');
  for (var line in lines){
    conv.add(
      Text(
        '${(conv.length / 2 + 1).round()}. $line',
        style: const TextStyle(fontSize: 20),
      ),
    );
    conv.add(const SizedBox(
      height: 20,
    ));
  }
  return conv;
}

List<Widget> fetchCloudJokes(List<dynamic> data){
  List<Widget> conv = [];
  data.addAll(content.split('\n'));
  Set<dynamic> tmp = data.toSet();
  for (dynamic str in tmp) {
    conv.add(
      Text(
        '${(conv.length / 2 + 1).round()}. ${str.toString()}',
        style: const TextStyle(fontSize: 20),
      ),
    );
    conv.add(const SizedBox(
      height: 20,
    ));
  }
  setLocal(tmp).then((value) => setCloud());


  return conv;
}

void fetchFile() async {
  final docdir = await getApplicationDocumentsDirectory();
  myFile = File('${docdir.path}/data.txt');
  if (!(await myFile.exists())) {
    myFile.create();
  }
}