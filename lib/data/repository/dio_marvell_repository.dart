import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/data/data_sources/local/character_data_source.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/remote_data_source.dart';

class DioMarvellRepository extends MarvellRepository {
  final CharacterDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  DioMarvellRepository({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Character> getCharacterDetail(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getCharacterDetail(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          Character? tempCharacter = data.results?.map((item) => item.fromApiToCharacter("standard_xlarge")).single;
          Character character = tempCharacter as Character;
          return character;
        } else {
          return Future.error("no data error");
        }
      } else {
        return Future.error("network error");
      }
    } catch (error) {
      return Future.error("$error");
    }
  }

  @override
  Future<List<Character>> getCharacters([int offset = 0, bool getFromLocal = true]) async {
    if (offset == 0 && getFromLocal) {
      List<Character> list = await localDataSource.characterDao.getAllCharacters();
      return list;
    }
    try {
      var httpResponse = await remoteDataSource.getCharacters(offset);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Character>? tempCharacters =
              data.results?.map((item) => item.fromApiToCharacter("standard_medium")).toList();
          List<Character> characters = tempCharacters ?? List.empty();
          localDataSource.characterDao.deleteOldData();
          localDataSource.characterDao.insertData(characters);
          return characters;
        } else {
          return Future.error("No data error");
        }
      } else {
        return Future.error("network error");
      }
    } catch (error) {
      if (getFromLocal) {
        return await localDataSource.characterDao.getAllCharacters();
      }
      return Future.error("$error");
    }
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getSeries(characterId);
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
