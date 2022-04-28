import 'dart:convert';
import 'package:marvelapp_flutter/data/model/response_models/thumbnail.dart';

class Results {
  int? id;
  String? name;
  String? title;
  String? description;
  Thumbnail? thumbnail;

  Results({this.id, this.name, this.description, this.thumbnail});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    Map<String, dynamic> thumbnailMap = json['thumbnail'];
    thumbnail = Thumbnail.fromJson(thumbnailMap);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}
