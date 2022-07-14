import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:data/data_module.dart';
import 'package:domain/domain_module.dart';

final getIt = GetIt.instance;

void setupDependencies() {
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
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource(marvellClient: getIt<MarvellClient>()));
  getIt.registerSingleton<MarvellRepository>(DefaultMarvellRepository(
      localDataSource: getIt<CharacterDataSource>(), remoteDataSource: getIt<RemoteDataSource>()));
  getIt.registerFactory(() => GetCharactersUseCase(repository: getIt<MarvellRepository>()));
  getIt.registerFactory(() => GetCharacterUseCase(repository: getIt<MarvellRepository>()));
  getIt.registerFactory(() => GetSeriesWithCharacterUseCase(repository: getIt<MarvellRepository>()));
}
