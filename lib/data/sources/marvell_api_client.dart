import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/data/model/response_models/api_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part 'marvell_api_client.g.dart';

@RestApi(baseUrl: "https://gateway.marvel.com:443/v1/public")
abstract class MarvellClient {
  factory MarvellClient(Dio dio, {String baseUrl}) = _MarvellClient;

  @GET("/characters")
  Future<HttpResponse<ApiResponse>> getCharacters(
    @Query("ts") String fakeTimeStamp,
    @Query("apikey") String publicKey,
    @Query("hash") String hash,
  );

  @GET("/characters/{characterId}")
  Future<HttpResponse<ApiResponse>> getCharacterDetail(
    @Path("characterId") String characterId,
    @Query("ts") String fakeTimeStamp,
    @Query("apikey") String publicKey,
    @Query("hash") String hash,
  );

  @GET("/characters/{characterId}/series")
  Future<HttpResponse<ApiResponse>> getSeries(
    @Path("characterId") String characterId,
    @Query("ts") String fakeTimeStamp,
    @Query("apikey") String publicKey,
    @Query("hash") String hash,
  );
}
