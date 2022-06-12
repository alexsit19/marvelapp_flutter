import 'package:dartz/dartz.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/error_handling/failure.dart';
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
  Future<Either<Failure, Character>> getCharacterDetail(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getCharacterDetail(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        try {
          Character? tempCharacter = data?.results?.map((item) => item.fromApiToCharacter("standard_xlarge")).single;
          Character character = tempCharacter as Character;
          return Right(character);
        } on Exception {
          return const Left(Failure.dataParsingFailure());
        }
      } else {
        return const Left(Failure.serverFailure());
      }
    } catch (error) {
      return const Left(Failure.connectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Character>>> getCharacters([int offset = 0, bool getFromLocal = true]) async {
    if (offset == 0 && getFromLocal) {
      List<Character> list = await localDataSource.characterDao.getAllCharacters();
      return Right(list);
    }
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
          return Right(characters);
        } on Exception {
          return const Left(Failure.dataParsingFailure());
        }
      } else {
        return const Left(Failure.serverFailure());
      }
    } catch (error) {
      if (getFromLocal) {
        var characters = await localDataSource.characterDao.getAllCharacters();
        return Right(characters);
      } else {
        return const Left(Failure.connectionFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getSeries(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getSeries(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        try {
          List<Series>? tempSeries = data?.results?.map((item) => item.toSeries("portrait_medium")).toList();
          List<Series> series = tempSeries ?? List.empty();
          return Right(series);
        } on Exception {
          return const Left(Failure.dataParsingFailure());
        }
      } else {
        return const Left(Failure.serverFailure());
      }
    } catch (error) {
      return const Left(Failure.connectionFailure());
    }
  }
}
