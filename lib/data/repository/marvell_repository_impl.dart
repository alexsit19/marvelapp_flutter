import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marvelapp_flutter/data/model/character.dart';
import 'package:marvelapp_flutter/data/model/response_models/api_response.dart';
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
        var jsonObject = jsonDecode(response.data.toString());
        var apiResponse = ApiResponse.fromJson(jsonObject);
        var data = apiResponse.data;
        List<Character>? listCharacters = data?.results
            ?.map((item) => Character(
                id: item.id,
                name: item.name,
                description: item.description,
                thumbnailPath: item.thumbnail?.path,
                thumbnailExtension: item.thumbnail?.extension))
            .toList();
        return listCharacters;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return Future.error("$error");
    }
    return null;
  }

  @override
  Future<Character?> getCharacterDetail(String characterId) async {
    try {
      Response response = await dio.get(
          'https://gateway.marvel.com:443/v1/public/characters/$characterId?ts=$ts&apikey=$publicKey&hash=$hash');
      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.data.toString());
        var apiResponse = ApiResponse.fromJson(jsonObject);
        var data = apiResponse.data;
        Character? character = data?.results
            ?.map((item) => Character(
                id: item.id,
                name: item.name,
                description: item.description,
                thumbnailPath: item.thumbnail?.path,
                thumbnailExtension: item.thumbnail?.extension))
            .single;
        return character;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return Future.error("$error");
    }
    return null;
  }

  @override
  Future<Series?> getSeries(String characterId) async {
    return null;
  }
}
