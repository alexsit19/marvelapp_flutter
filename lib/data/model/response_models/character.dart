import 'package:marvelapp_flutter/data/model/response_models/thumbnail.dart';

class Character {
  final int? id;
  final String? name;
  final String? thumbnailPath;
  final String? thumbnailExtension;
  final String? description;

  const Character(
      {required this.id,
      required this.name,
      required this.thumbnailPath,
      required this.thumbnailExtension,
      required this.description});

  String getThumbnailUrl(String size) {
    String thumbnailUrl = "";
    if (thumbnailPath != null && thumbnailExtension != null) {
      thumbnailUrl = "$thumbnailPath/$size.$thumbnailExtension";
    }
    return thumbnailUrl;
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    Thumbnail? thumbnail = Thumbnail.fromJson(json['thumbnail']);
    String? path = thumbnail.path;
    String? extension = thumbnail.extension;
    return Character(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnailPath: null,
        thumbnailExtension: null);
  }
}
