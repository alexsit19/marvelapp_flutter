import 'package:drift/drift.dart';
import 'package:marvelapp_flutter/data/converters/from_table_to_character.dart';
import 'package:marvelapp_flutter/data/data_sources/local/database/database.dart';
import 'package:marvelapp_flutter/data/data_sources/local/database_tables/character_table.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [CharacterTable])
class CharacterDao extends DatabaseAccessor<Database> with _$CharacterDaoMixin {
  final Database database;

  CharacterDao(this.database) : super(database);

  Future<void> insertData(List<Character> characters) async {
    var count = database.characterTable.id.count();
    var query = database.selectOnly(database.characterTable)..addColumns([count]);
    int numberOfRows = await query.map((row) => row.read(count)).getSingle();
    if (characters.isNotEmpty && numberOfRows == 0) {
      for (var element in characters) {
        await database.into(database.characterTable).insert(CharacterTableCompanion(
              id: Value(element.id),
              name: Value(element.name),
              thumbnailUrl: Value(element.thumbnailUrl),
            ));
      }
    }
  }

  Future<void> deleteOldData() async {
    database.delete(database.characterTable);
  }

  Future<List<Character>> getAllCharacters() async {
    var characters = await database.select(database.characterTable).get();
    List<Character> list = characters
        .map(
          (item) => item.fromTableToCharacter(),
        )
        .toList();
    if (characters.isEmpty) {
      return List.empty();
    }
    return list;
  }
}
