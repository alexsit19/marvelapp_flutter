class Character {
  final int id;
  final String name;
  final String thumbnailPath;
  final String thumbnailExtension;
  final String? description;

  const Character(
      {required this.id,
      required this.name,
      required this.thumbnailPath,
      required this.thumbnailExtension,
      required this.description});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        thumbnailPath: json['thumbnail']['path'],
        thumbnailExtension: json['thumbnail']['extension'],
        description: json['description']);
  }
}
