import 'package:marvelapp_flutter/data/model/response_models/character.dart';

import '../model/response_models/series.dart';

abstract class MarvellRepository {
  Future<List<Character>?> getCharacters();
  Future<Character?> getCharacterDetail(String characterId);
  Future<List<Series>?> getSerieses(String characterId);
}
