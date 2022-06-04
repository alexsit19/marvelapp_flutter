import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/data/marvell_api_client.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';

class RemoteDataSource {
  static final RemoteDataSource _remoteDataSource = RemoteDataSource._internal();
  final String fakeTimeStamp = "12345";
  final String publicKey = "b2bd25766ee84a0881b157960b3d3590";
  final String hash = "f43ba4d3c12135105017b1f45993942e";
  final MarvellClient marvellClient = MarvellClient(
      Dio(BaseOptions(contentType: 'application/json', responseType: ResponseType.plain)),
      baseUrl: "https://gateway.marvel.com:443/v1/public/");

  factory RemoteDataSource() {
    return _remoteDataSource;
  }

  RemoteDataSource._internal();

  Future<List<Character>> getCharacters([offset = 0]) async {
    try {
      var httpResponse = await marvellClient.getCharacters(fakeTimeStamp, publicKey, hash, offset);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Character>? tempCharacters = data.results?.map((item) => item.toCharacter("standard_medium")).toList();
          List<Character> characters = tempCharacters ?? List.empty();
          return characters;
        } else {
          print("no data error");
          return Future.error("No data error");
        }
      } else {
        print("network error");
        return Future.error("network error");
      }
    } catch (error) {
      print("exception");
      return Future.error("$error");
    }
  }

  Future<Character> getCharacterDetail(String characterId) async {
    try {
      var httpResponse = await marvellClient.getCharacterDetail(characterId, fakeTimeStamp, publicKey, hash);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          Character? tempCharacter = data.results?.map((item) => item.toCharacter("standard_xlarge")).single;
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

  Future<List<Series>> getSeries(String characterId) async {
    try {
      var httpResponse = await marvellClient.getSeries(characterId, fakeTimeStamp, publicKey, hash);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Series>? tempSeries = data.results?.map((item) => item.toSeries("portrait_medium")).toList();
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
