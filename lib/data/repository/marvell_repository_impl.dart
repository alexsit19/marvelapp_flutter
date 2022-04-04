import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/data/model/character.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';

import '../model/series.dart';

class MarvellRepositoryImpl extends MarvellRepository {
  final Dio dio = Dio(
    BaseOptions(
        contentType: 'application/json', responseType: ResponseType.plain),
  );
  final String ts = "12345";
  final String publicKey = "b2bd25766ee84a0881b157960b3d3590";
  final String hash = "f43ba4d3c12135105017b1f45993942e";

  @override
  Future<List<Character>?> getListCharacters() async {
    try {
      Response response = await dio.get(
        'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$publicKey&hash=$hash',
      );
      if (response.statusCode == 200) {
        Map jsonObject = jsonDecode(response.data.toString());
        var listOfCharacter = jsonObject['data']['results'] as List;
        var listCh = listOfCharacter.map((e) => Character.fromJson(e)).toList();
        return listCh;
      }
    } catch (error) {
      return Future.error("$error");
    }
    return null;
  }

  @override
  Future<Character?> getCharacterDetail(String characterId) async {
    try {
      Response response = await dio.get(
          'https://gateway.marvel.com:443/v1/public/characters/$characterId?ts=$ts&apikey=$publicKey&hash=$hash');
      https://gateway.marvel.com/v1/public/stories/36908?apiKey=b2bd25766ee84a0881b157960b3d3590&hash=f43ba4d3c12135105017b1f45993942e
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonObject = jsonDecode(response.data.toString());
        var listOfResults = jsonObject['data']['results'];
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(listOfResults);
        Character character = Character.fromJson(data[0]);
        return character;
      }
    } catch (error) {
      return Future.error("$error");
    }
    return null;
  }

  @override
  Future<Series?> getSeries(String characterId) async {
    return null;
  }
}
