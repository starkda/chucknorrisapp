// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      json['categories'] as List<dynamic>,
      json['created_at'] as String,
      json['icon_url'] as String,
      json['id'] as String,
      json['updated_at'] as String,
      json['url'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'categories': instance.categories,
      'created_at': instance.created_at,
      'icon_url': instance.icon_url,
      'id': instance.id,
      'updated_at': instance.updated_at,
      'url': instance.url,
      'value': instance.value,
    };
