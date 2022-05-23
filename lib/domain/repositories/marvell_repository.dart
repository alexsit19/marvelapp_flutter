import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';

abstract class MarvellRepository {
  Future<List<Character>> getCharacters([int offset]);
  Future<Character> getCharacterDetail(String characterId);
  Future<List<Series>> getSeries(String characterId);
}
