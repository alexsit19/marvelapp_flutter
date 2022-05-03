import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';
import 'package:marvelapp_flutter/data/model/response_models/api_response.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';

class DioMarvellRepository extends MarvellRepository {
  final Dio dio = Dio(
    BaseOptions(
        contentType: 'application/json', responseType: ResponseType.plain),
  );
  final String fakeTimeStamp = "12345";
  final String publicKey = "b2bd25766ee84a0881b157960b3d3590";
  final String hash = "f43ba4d3c12135105017b1f45993942e";

  @override
  Future<List<Character>> getCharacters() async {
    try {
      Response response = await dio.get(
        'https://gateway.marvel.com:443/v1/public/characters?ts=$fakeTimeStamp&apikey=$publicKey&hash=$hash',
      );
      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.data.toString());
        var apiResponse = ApiResponse.fromJson(jsonObject);
        var data = apiResponse.data;
        if (data != null) {
          List<Character>? tempCharacterList =
              data.results?.map((item) => item.toCharacter()).toList();
          List<Character> listCharacters = tempCharacterList ?? List.empty();
          return listCharacters;
        } else {
          return Future.error("No data error");
        }
      } else {
        return Future.error("network error");
      }
    } catch (error) {
      return Future.error("$error");
    }
  }

  @override
  Future<Character> getCharacterDetail(String characterId) async {
    try {
      Response response = await dio.get(
          'https://gateway.marvel.com:443/v1/public/characters/$characterId?ts=$fakeTimeStamp&apikey=$publicKey&hash=$hash');
      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.data.toString());
        var apiResponse = ApiResponse.fromJson(jsonObject);
        var data = apiResponse.data;
        if (data != null) {
          Character? tempCharacter =
              data.results?.map((item) => item.toCharacter()).single;
          Character character = tempCharacter as Character;
          return character;
        } else {
          return Future.error("No data error");
        }
      } else {
        return Future.error("network error");
      }
    } catch (error) {
      return Future.error("$error");
    }
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    try {
      Response response = await dio.get(
          'https://gateway.marvel.com:443/v1/public/characters/$characterId/series?ts=$fakeTimeStamp&apikey=$publicKey&hash=$hash');
      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.data.toString());
        var apiResponse = ApiResponse.fromJson(jsonObject);
        var data = apiResponse.data;
        if (data != null) {
          List<Series>? tempSeries =
              data.results?.map((item) => item.toSeries()).toList();
          List<Series> series = tempSeries ?? List.empty();
          return series;
        } else {
          return Future.error("No data error");
        }
      } else {
        return Future.error("network error");
      }
    } catch (error) {
      return Future.error("$error");
    }
  }
}
