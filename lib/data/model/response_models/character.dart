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

  static Character empty() {
    return const Character(
        id: null,
        name: null,
        thumbnailPath: null,
        thumbnailExtension: null,
        description: null);
  }
}
