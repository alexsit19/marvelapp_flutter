import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/data/sources/marvell_api_client.dart';

class DioMarvellRepository extends MarvellRepository {
  final String fakeTimeStamp = "12345";
  final String publicKey = "b2bd25766ee84a0881b157960b3d3590";
  final String hash = "f43ba4d3c12135105017b1f45993942e";
  final MarvellClient marvellClient = MarvellClient(
      Dio(BaseOptions(contentType: 'application/json', responseType: ResponseType.plain)),
      baseUrl: "https://gateway.marvel.com:443/v1/public/");

  @override
  Future<List<Character>> getCharacters() async {
    try {
      var httpResponse = await marvellClient.getCharacters(fakeTimeStamp, publicKey, hash);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Character>? tempCharacters = data.results?.map((e) => e.toCharacter()).toList();
          List<Character> characters = tempCharacters ?? List.empty();
          return characters;
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
      var httpResponse = await marvellClient.getCharacterDetail(characterId, fakeTimeStamp, publicKey, hash);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          Character? tempCharacter = data.results?.map((item) => item.toCharacter()).single;
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
      var httpResponse = await marvellClient.getSeries(characterId, fakeTimeStamp, publicKey, hash);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Series>? tempSeries = data.results?.map((item) => item.toSeries()).toList();
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
