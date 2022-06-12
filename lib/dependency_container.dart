import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marvelapp_flutter/data/data_sources/local/dao/character_dao.dart';
import 'package:marvelapp_flutter/data/data_sources/local/database/database.dart';
import 'package:marvelapp_flutter/data/data_sources/local/character_data_source.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/remote_data_source.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Database>(() => Database());
  getIt.registerLazySingleton<CharacterDao>(() => CharacterDao(getIt<Database>()));
  getIt.registerSingleton<BaseOptions>(
    BaseOptions(
        contentType: 'application/json',
        responseType: ResponseType.plain,
        baseUrl: "https://gateway.marvel.com:443/v1/public/"),
  );
  getIt.registerSingleton<Dio>(Dio(getIt<BaseOptions>()));
  getIt.registerSingleton<CharacterDataSource>(CharacterDataSource(characterDao: getIt<CharacterDao>()));
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());
}