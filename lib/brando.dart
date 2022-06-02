import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Joke.dart';
const String source = 'https://api.chucknorris.io/jokes/random';

Future<Joke?> Data() async{
  var response =  await Dio().get(source);
  Map<String, dynamic> kek = response.data;
  return Joke.fromjson(kek);
}
