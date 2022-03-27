import 'package:marvelapp_flutter/data/character.dart';
import 'package:marvelapp_flutter/data/series.dart';
import 'package:marvelapp_flutter/data/comic.dart';

class Stories {
  final int id;
  final String title;
  final String description;
  final String type;
  final String thumbnail;
  final List<Comic> comics;
  final List<Series> series;
  final List<Character> characters;

  const Stories(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.thumbnail,
      required this.comics,
      required this.series,
      required this.characters});

  factory Stories.fromJson(Map<String, dynamic> json) {
    return Stories(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        type: json['type'],
        thumbnail: json['thumbnail'],
        comics: json['comics'],
        series: json['series'],
        characters: json['characters']);
  }
}
