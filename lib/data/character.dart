import 'package:marvelapp_flutter/data/comic.dart';
import 'package:marvelapp_flutter/data/series.dart';
import 'package:marvelapp_flutter/data/stories.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final List<Comic>? comics;
  final List<Stories>? stories;
  final List<Series>? series;

  const Character(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail,
      required this.comics,
      required this.stories,
      required this.series});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        comics: json['comics'],
        stories: json['stories'],
        series: json['series']);
  }
}
