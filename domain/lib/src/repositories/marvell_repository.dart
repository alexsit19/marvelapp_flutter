import 'package:domain/domain_module.dart';

abstract class MarvellRepository {
  Future<List<Character>> getCharacters([int offset]);
  Future<Character> getCharacterDetail(String characterId);
  Future<List<Series>> getSeries(String characterId);
}
