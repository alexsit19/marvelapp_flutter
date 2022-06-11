class JsonPlaceholderV1 {
  JsonPlaceholderV1({
    required this.httpClient,
  });

  final http.Client httpClient;

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await httpClient.get(
        Uri.https('jsonplaceholder.typicode.com', '/posts'),
      );

      if (response.statusCode == 200) {
        try {
          final List<PostModel> posts = [];
          final data = json.decode(utf8.decode(response.bodyBytes)) as List;

          for (int i = 0; i < data.length; i++) {
            posts.add(PostModel.fromJson(data[i]));
          }

          return posts;
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      if ((e is ServerException) || (e is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }
}