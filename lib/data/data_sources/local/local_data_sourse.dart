import 'package:marvelapp_flutter/domain/entities/character.dart';

abstract class LocalDataSource {
  Future<void> insertCharacters(List<Character> characters);

  Future<List<Character>> getCharacters();
}
