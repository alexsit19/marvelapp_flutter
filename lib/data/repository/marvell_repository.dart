import 'package:marvelapp_flutter/data/model/response_models/character.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';

abstract class MarvellRepository {
  Future<List<Character>> getCharacters();
  Future<Character> getCharacterDetail(String characterId);
  Future<List<Series>> getSeries(String characterId);
}
