import 'package:dio/dio.dart';
import 'package:marvelapp_flutter/data/data_sources/remote/marvell_api_client.dart';
import 'package:retrofit/dio.dart';
import 'package:marvelapp_flutter/data/model/response_models/api_response.dart';

class RemoteDataSource {
  static final RemoteDataSource _remoteDataSource = RemoteDataSource._internal();
  final String fakeTimeStamp = "12345";
  final String publicKey = "b2bd25766ee84a0881b157960b3d3590";
  final String hash = "f43ba4d3c12135105017b1f45993942e";
  final MarvellClient marvellClient = MarvellClient(
      Dio(BaseOptions(contentType: 'application/json', responseType: ResponseType.plain, connectTimeout: 4000)),
      baseUrl: "https://gateway.marvel.com:443/v1/public/");

  factory RemoteDataSource() {
    return _remoteDataSource;
  }

  RemoteDataSource._internal();

  Future<HttpResponse<ApiResponse>> getCharacters([offset = 0]) async {
    return marvellClient.getCharacters(fakeTimeStamp, publicKey, hash, offset);
  }

  Future<HttpResponse<ApiResponse>> getCharacterDetail(String characterId) async {
    return marvellClient.getCharacterDetail(characterId, fakeTimeStamp, publicKey, hash);
  }

  Future<HttpResponse<ApiResponse>> getSeries(String characterId) async {
    return marvellClient.getSeries(characterId, fakeTimeStamp, publicKey, hash);
  }
}
