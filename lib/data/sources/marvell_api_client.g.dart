// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvell_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MarvellClient implements MarvellClient {
  _MarvellClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://gateway.marvel.com:443/v1/public';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Character>> getCharacters(fakeTimeStamp, publicKey, hash) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'ts': fakeTimeStamp,
      r'apikey': publicKey,
      r'hash': hash
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Character>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/characters',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Character.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Character> getCharacterDetail(characterId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Character>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/characters/${characterId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Character.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Series>> getSeries(characterId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Series>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/characters/${characterId}/series',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Series.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
