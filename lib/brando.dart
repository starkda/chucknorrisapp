import 'package:dio/dio.dart';
import 'package:untitled/joke.dart';
const String source = 'https://api.chucknorris.io/jokes/random';

Future<Joke?> data() async {
      var response = await Dio().get(source);
      Map<String, dynamic> kek = response.data;
      return Joke.fromjson(kek);
}

