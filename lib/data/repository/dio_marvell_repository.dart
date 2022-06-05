import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/data/local/source/local_data_source.dart';
import 'package:marvelapp_flutter/data/remote/source/remote_data_source.dart';

class DioMarvellRepository extends MarvellRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  DioMarvellRepository({required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Character> getCharacterDetail(String characterId) async {
    return await remoteDataSource.getCharacterDetail(characterId);
  }

  @override
  Future<List<Character>> getCharacters([int offset = 0]) async {
    var characters = await remoteDataSource.getCharacters(offset).onError((error, stackTrace) => errorHandle());
    if (characters.isNotEmpty) {
      localDataSource.characterDao.insertData(characters);
    }
    return characters;
  }

  Future<List<Character>> errorHandle() async {
    return await localDataSource.characterDao.getAllCharacters();
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    return await remoteDataSource.getSeries(characterId);
  }
}
