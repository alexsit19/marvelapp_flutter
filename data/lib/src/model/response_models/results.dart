import 'package:data/data_module.dart';
import 'package:domain/domain_module.dart';

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

  Series toSeries(String size) {
    return Series(
      id: id,
      title: title,
      thumbnailUrl: collectThumbnailUrl(size),
    );
  }

  Character fromApiToCharacter(String size) {
    return Character(
      id: id,
      name: name,
      thumbnailUrl: collectThumbnailUrl(size),
      description: description,
    );
  }

  String? collectThumbnailUrl(String size) {
    String? thumbnailUrl = "${thumbnail?.path}/$size.${thumbnail?.extension}";
    return thumbnailUrl;
  }
}
