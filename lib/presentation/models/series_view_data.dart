class SeriesViewData {
  final String? title;
  final String? description;
  final String? thumbnailPath;
  final String? thumbnailExtension;

  const SeriesViewData({
    required this.title,
    required this.thumbnailPath,
    required this.thumbnailExtension,
    required this.description,
  });

  String? getThumbnailUrl(String size) {
    String? thumbnailUrl;
    if (thumbnailPath != null && thumbnailExtension != null) {
      thumbnailUrl = "$thumbnailPath/$size.$thumbnailExtension";
    }
    return thumbnailUrl;
  }
}
