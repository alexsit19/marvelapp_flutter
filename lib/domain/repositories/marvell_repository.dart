import 'package:marvelapp_flutter/domain/result_details.dart';
import 'package:marvelapp_flutter/domain/result_home.dart';
import 'package:marvelapp_flutter/domain/result_series.dart';

abstract class MarvellRepository {
  Future<ResultHome> getCharacters([int offset, bool getFromLocal]);
  Future<ResultDetails> getCharacterDetail(String characterId);
  Future<ResultSeries> getSeries(String characterId);
}
