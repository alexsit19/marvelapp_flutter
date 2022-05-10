import 'package:marvelapp_flutter/data/model/response_models/thumbnail.dart';

class Series {
  final int? id;
  final String? title;
  final String? description;
  final String? thumbnailPath;
  final String? thumbnailExtension;

  const Series(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailPath,
      required this.thumbnailExtension});

  String? getThumbnailUrl(String size) {
    String? thumbnailUrl;
    if (thumbnailPath != null && thumbnailExtension != null) {
      thumbnailUrl = "$thumbnailPath/$size.$thumbnailExtension";
    }
    return thumbnailUrl;
  }

  factory Series.fromJson(Map<String, dynamic> json) {
    Thumbnail? thumbnail = Thumbnail.fromJson(json['thumbnail']);
    String? path = thumbnail.path;
    String? extension = thumbnail.extension;
    return Series(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailPath: path,
      thumbnailExtension: extension,
    );
  }
}
