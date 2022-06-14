import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/error_handling/exceptions.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/data/data_sources/local/character_data_source.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/remote_data_source.dart';

class DioMarvellRepository extends MarvellRepository {
  late CharacterDataSource localDataSource;
  late RemoteDataSource remoteDataSource;

  static final DioMarvellRepository _repository = DioMarvellRepository._internal();

  DioMarvellRepository._internal();

  factory DioMarvellRepository(CharacterDataSource localDataSource, RemoteDataSource remoteDataSource) {
    _repository.localDataSource = localDataSource;
    _repository.remoteDataSource = remoteDataSource;
    return _repository;
  }

  @override
  Future<Character> getCharacterDetail(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getCharacterDetail(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        try {
          Character? tempCharacter = data?.results?.map((item) => item.fromApiToCharacter("standard_xlarge")).single;
          Character character = tempCharacter as Character;
          return character;
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw DataRetrieveException();
      }
    } catch (error) {
      if ((error is DataRetrieveException) || (error is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }

  @override
  Future<List<Character>> getCharacters([int offset = 0]) async {
    try {
      var httpResponse = await remoteDataSource.getCharacters(offset);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        try {
          List<Character>? tempCharacters =
          data?.results?.map((item) => item.fromApiToCharacter("standard_medium")).toList();
          List<Character> characters = tempCharacters ?? List.empty();
          localDataSource.characterDao.deleteOldData();
          localDataSource.characterDao.insertData(characters);
          return characters;
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw DataRetrieveException();
      }
    } catch (error) {
      if ((error is DataRetrieveException) || (error is DataParsingException)) {
        rethrow;
      } else {
        if (offset == 0) {
          return localDataSource.characterDao.getAllCharacters();
        } else {
          throw NoConnectionException();
        }
      }
    }
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getSeries(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        try {
          List<Series>? tempSeries = data?.results?.map((item) => item.toSeries("portrait_medium")).toList();
          List<Series> series = tempSeries ?? List.empty();
          return series;
        } on Exception {
          throw DataParsingException();
        }
      } else {
        throw DataRetrieveException();
      }
    } catch (error) {
      if ((error is DataRetrieveException) || (error is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }
}
