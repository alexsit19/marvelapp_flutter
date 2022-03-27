class Comic {
  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String thumbnail;
  final List<String> images;

  const Comic(
      {required this.id,
      required this.digitalId,
      required this.title,
      required this.issueNumber,
      required this.variantDescription,
      required this.description,
      required this.thumbnail,
      required this.images});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
        id: json['id'],
        digitalId: json['digitalId'],
        title: json['title'],
        issueNumber: json['issueNumber'],
        variantDescription: json['variantDescription'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        images: json['images']);
  }
}
