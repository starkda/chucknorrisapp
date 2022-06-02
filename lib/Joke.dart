import 'package:json_annotation/json_annotation.dart';

part 'Joke.g.dart';

@JsonSerializable()
class Joke {
  List<dynamic> categories;
  String created_at;
  String icon_url;
  String id;
  String updated_at;
  String url;
  String value = 'Loading...';

  Joke(this.categories, this.created_at, this.icon_url, this.id,
      this.updated_at, this.url, this.value);

  factory Joke.fromjson(Map<String, dynamic> dt) => _$JokeFromJson(dt);
}
