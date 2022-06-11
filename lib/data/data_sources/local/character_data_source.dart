import 'package:marvelapp_flutter/data/data_sources/local/dao/character_dao.dart';
import 'package:marvelapp_flutter/data/data_sources/local/local_character_data_sourse.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

class CharacterDataSource implements LocalCharacterDataSource {
  final CharacterDao characterDao;

  CharacterDataSource({required this.characterDao});

  @override
  Future<void> insertCharacters(List<Character> characters) async {
    await characterDao.insertData(characters);
  }

  @override
  Future<List<Character>> getCharacters() async {
    return await characterDao.getAllCharacters();
  }

  @override
  Future<void> deleteOldCharacters() async {
    return await characterDao.deleteOldData();
  }
}
