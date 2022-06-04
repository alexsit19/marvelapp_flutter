import 'package:marvelapp_flutter/data/local/dao/character_dao.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

class LocalDataSource {
  final CharacterDao characterDao;

  LocalDataSource({required this.characterDao});

  Future<void> insertCharacters(List<Character> characters) async {
    await characterDao.insertData(characters);
  }

  Future<List<Character>> getCharacters() async {
    return await characterDao.getAllCharacters();
  }
}
