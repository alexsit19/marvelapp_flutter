import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/data/data_sources/local/character_data_source.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/remote_data_source.dart';
import 'package:marvelapp_flutter/domain/result_details.dart';
import 'package:marvelapp_flutter/domain/result_home.dart';
import 'package:marvelapp_flutter/domain/result_series.dart';

class DioMarvellRepository extends MarvellRepository {
  final CharacterDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  DioMarvellRepository({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<ResultDetails> getCharacterDetail(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getCharacterDetail(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          Character? tempCharacter = data.results?.map((item) => item.fromApiToCharacter("standard_xlarge")).single;
          Character character = tempCharacter as Character;
          ResultDetails resultDetails = ResultDetails.success(character: character);
          return resultDetails;
        } else {
          return const ResultDetailsError(errorString: "no data error");
        }
      } else {
        return const ResultDetailsError(errorString: "network error");
      }
    } catch (error) {
      return ResultDetailsError(errorString: "$error");
    }
  }

  @override
  Future<ResultHome> getCharacters([int offset = 0, bool getFromLocal = true]) async {
    if (offset == 0 && getFromLocal) {
      List<Character> list = await localDataSource.characterDao.getAllCharacters();
      ResultHome resultHome = ResultHome.success(characters: list);
      return resultHome;
    }
    try {
      var httpResponse = await remoteDataSource.getCharacters(offset);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Character>? tempCharacters =
              data.results?.map((item) => item.fromApiToCharacter("standard_medium")).toList();
          List<Character> characters = tempCharacters ?? List.empty();
          localDataSource.characterDao.insertData(characters);
          ResultHome resultHome = ResultHome.success(characters: characters);
          return resultHome;
        } else {
          return const ResultHomeError(errorString: "No data error");
        }
      } else {
        return const ResultHomeError(errorString: "network error");
      }
    } catch (error) {
      final ResultHome resultHome;
      if (getFromLocal) {
        resultHome = ResultHome.success(characters: await localDataSource.characterDao.getAllCharacters());
      } else {
       resultHome = ResultHomeError(errorString: error.toString());
      }
      return resultHome;
    }
  }

  Future<ResultHome> errorHandle() async {
    ResultHome resultHome =
        ResultHomeSuccess(characters: await localDataSource.characterDao.getAllCharacters());
    return resultHome;
  }

  @override
  Future<ResultSeries> getSeries(String characterId) async {
    try {
      var httpResponse = await remoteDataSource.getSeries(characterId);
      if (httpResponse.response.statusCode == 200) {
        var data = httpResponse.data.data;
        if (data != null) {
          List<Series>? tempSeries = data.results?.map((item) => item.toSeries("portrait_medium")).toList();
          List<Series> series = tempSeries ?? List.empty();
          ResultSeries resultSeries = ResultSeries.success(series: series);
          return resultSeries;
        } else {
          return const ResultSeriesError(errorString: "No data error");
        }
      } else {
        return const ResultSeriesError(errorString: "network error");
      }
    } catch (error) {
      return ResultSeriesError(errorString: "$error");
    }
  }
}
