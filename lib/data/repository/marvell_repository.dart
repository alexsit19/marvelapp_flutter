import 'package:marvelapp_flutter/data/model/character.dart';

import '../model/series.dart';

abstract class MarvellRepository {
  Future<List<Character>?> getListCharacters();
  Future<Character?> getCharacterDetail(String characterId);
  Future<Series?> getSeries(String characterId);
}
