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
}
