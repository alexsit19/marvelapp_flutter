import 'package:domain/domain_module.dart';

abstract class LocalCharacterDataSource {
  Future<void> insertCharacters(List<Character> characters);

  Future<List<Character>> getCharacters();

  Future<void> deleteOldCharacters();
}
