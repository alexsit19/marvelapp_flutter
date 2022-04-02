class Character {
  final int id;
  final String name;
  final String thumbnailPath;
  final String thumbnailExtension;

  const Character(
      {required this.id,
      required this.name,
      required this.thumbnailPath,
      required this.thumbnailExtension});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        thumbnailPath: json['thumbnail']['path'],
        thumbnailExtension: json['thumbnail']['extension']);
  }
}
