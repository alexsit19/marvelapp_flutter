class Series {
  final int id;
  final String title;
  final String description;
  final String thumbnail;

  const Series(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnail});

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        thumbnail: json['thumbnail']);
  }
}
