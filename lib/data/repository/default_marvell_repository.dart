import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/error_handling/exceptions.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/data/data_sources/local/character_data_source.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/remote_data_source.dart';

class DefaultMarvellRepository extends MarvellRepository {
  late CharacterDataSource localDataSource;
  late RemoteDataSource remoteDataSource;

  DefaultMarvellRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Character> getCharacterDetail(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getCharacterDetail(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        Character? tempCharacter = data?.results?.map((item) => item.fromApiToCharacter("standard_xlarge")).single;
        Character character = tempCharacter as Character;
        return character;
      } else {
        throw DataRetrieveException();
      }
    } on DioError catch (error) {
      throw _getException(error);
    }
  }

  @override
  Future<List<Character>> getCharacters([int offset = 0]) async {
    if (offset == 0) {
      List<Character> characters;
      try {
        characters = await _getRemote(offset);
      } on Exception {
        characters = await _getLocal();
      }
      return characters;
    }
    try {
      return _getRemote(offset);
    } on DioError catch (error) {
      throw _getException(error);
    }
  }

  Future<List<Character>> _getRemote(int offset) async {
    List<Character> characters = List.empty();
    try {
      var httpResponse = await remoteDataSource.getCharacters(offset);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        List<Character>? tempCharacters =
            data?.results?.map((item) => item.fromApiToCharacter("standard_medium")).toList();
        characters = tempCharacters ?? characters;
        if (offset == 0) {
          await _saveCharactersInDatabase(characters);
        }
      }
      return characters;
    } on DioError catch (error) {
      throw _getException(error);
    }
  }

  Future<List<Character>> _getLocal() async {
    try {
      return await localDataSource.characterDao.getAllCharacters();
    } catch (error) {
      throw NoConnectionException();
    }
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getSeries(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;

        List<Series>? tempSeries = data?.results?.map((item) => item.toSeries("portrait_medium")).toList();
        List<Series> series = tempSeries ?? List.empty();
        return series;
      } else {
        throw DataRetrieveException();
      }
    } on DioError catch (error) {
      throw _getException(error);
    }
  }

  Future<void> _saveCharactersInDatabase(List<Character> characters) async {
    await localDataSource.characterDao.deleteOldData();
    await localDataSource.characterDao.insertData(characters);
  }

  Exception _getException(DioError error) {
    Exception exception = NoConnectionException();
    if (error.type == DioErrorType.connectTimeout) {
      exception = DataRetrieveException();
    }
    return exception;
  }
}
