class Series {
  final String title;
  final String? description;
  final String thumbnailPath;
  final String thumbnailExtension;

  const Series({
    required this.title,
    required this.thumbnailPath,
    required this.thumbnailExtension,
    required this.description,
  });
}
