import 'package:marvelapp_flutter/data/model/character.dart';

abstract class MarvellRepository {
  Future<List<Character>?> getListCharacters();
}
