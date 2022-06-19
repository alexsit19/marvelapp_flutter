import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marvelapp_flutter/data/data_sources/local/dao/character_dao.dart';
import 'package:marvelapp_flutter/data/data_sources/local/database/database.dart';
import 'package:marvelapp_flutter/data/data_sources/local/character_data_source.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/marvell_api_client.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/remote_data_source.dart';
import 'package:marvelapp_flutter/data/repository/default_marvell_repository.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_character_use_case.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_series_with_character_use_case.dart';

final getIt = GetIt.instance;

void setupDependences() {
  getIt.registerLazySingleton<Database>(() => Database());
  getIt.registerSingleton<CharacterDao>(CharacterDao(getIt<Database>()));
  getIt.registerSingleton<BaseOptions>(BaseOptions(
      contentType: 'application/json',
      responseType: ResponseType.plain,
      baseUrl: "https://gateway.marvel.com:443/v1/public/",
      connectTimeout: 4000));

  getIt.registerSingleton<CharacterDataSource>(CharacterDataSource(characterDao: getIt<CharacterDao>()));
  getIt.registerSingleton<Dio>(Dio(getIt<BaseOptions>()));
  getIt.registerSingleton<MarvellClient>(MarvellClient(getIt<Dio>()));
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());
  getIt.registerSingleton<DefaultMarvellRepository>(
      DefaultMarvellRepository(getIt<CharacterDataSource>(), getIt<RemoteDataSource>()));
  getIt.registerFactory(() => GetCharactersUseCase(repository: getIt<DefaultMarvellRepository>()));
  getIt.registerFactory(() => GetCharacterUseCase(repository: getIt<DefaultMarvellRepository>()));
  getIt.registerFactory(() => GetSeriesWithCharacterUseCase(repository: getIt<DefaultMarvellRepository>()));
}
