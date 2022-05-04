import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/response_models/character.dart';
import '../model/response_models/series.dart';

part 'marvell_api_client.g.dart';

@RestApi(baseUrl: "https://gateway.marvel.com:443/v1/public")
abstract class MarvellClient {
  factory MarvellClient(Dio dio, {String baseUrl}) = _MarvellClient;

  @GET("/characters")
  Future<List<Character>> getCharacters(
    @Query("ts") String fakeTimeStamp,
    @Query("apikey") String publicKey,
    @Query("hash") String hash,
  );

  @GET("/characters/{characterId}")
  Future<Character> getCharacterDetail(@Path("characterId") String characterId);

  @GET("/characters/{characterId}/series")
  Future<List<Series>> getSeries(@Path("characterId") String characterId);
}
