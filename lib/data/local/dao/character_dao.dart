import 'package:drift/drift.dart';
import 'package:marvelapp_flutter/data/local/database/database.dart';
import 'package:marvelapp_flutter/data/local/database_tables/character_table.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [CharacterTable])
class CharacterDao extends DatabaseAccessor<Database> with _$CharacterDaoMixin {
  final Database database;

  CharacterDao(this.database) : super(database);

  Future<void> insertData(List<Character> characters) async {
    if (characters.isNotEmpty) {
      for (var element in characters) {
        await database.into(database.characterTable).insert(CharacterTableCompanion(
              id: Value(element.id),
              name: Value(element.name),
              thumbnailUrl: Value(element.thumbnailUrl),
            ));
      }
    }
  }

  Future<List<Character>> getAllCharacters() async {
    List<Character> characters = (await database.select(database.characterTable).get()).cast<Character>();
    return characters;
  }
}
