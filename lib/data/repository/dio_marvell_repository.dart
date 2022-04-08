import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';
import 'package:marvelapp_flutter/data/model/response_models/api_response.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import '../model/response_models/series.dart';

class DioMarvellRepository extends MarvellRepository {
  final Dio dio = Dio(
    BaseOptions(
        contentType: 'application/json', responseType: ResponseType.plain),
  );
  final String fakeTimeStamp = "12345";
  final String publicKey = "b2bd25766ee84a0881b157960b3d3590";
  final String hash = "f43ba4d3c12135105017b1f45993942e";

  @override
  Future<List<Character>?> getCharacters() async {
    try {
      Response response = await dio.get(
        'https://gateway.marvel.com:443/v1/public/characters?ts=$fakeTimeStamp&apikey=$publicKey&hash=$hash',
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
          'https://gateway.marvel.com:443/v1/public/characters/$characterId?ts=$fakeTimeStamp&apikey=$publicKey&hash=$hash');
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
  Future<List<Series>?> getSerieses(String characterId) async {
    try {
      Response response = await dio.get(
          'https://gateway.marvel.com:443/v1/public/characters/$characterId/series?ts=$fakeTimeStamp&apikey=$publicKey&hash=$hash');
      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.data.toString());
        var apiResponse = ApiResponse.fromJson(jsonObject);
        var data = apiResponse.data;
        List<Series>? serieses = data?.results
            ?.map((item) => Series(
                id: item.id,
                title: item.title,
                description: item.description,
                thumbnailPath: item.thumbnail?.path,
                thumbnailExtension: item.thumbnail?.extension))
            .toList();
        return serieses;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return Future.error("$error");
    }
    return null;
  }
}
