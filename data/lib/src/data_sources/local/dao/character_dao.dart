import 'package:drift/drift.dart';
import 'package:data/data_module.dart';
import 'package:domain/domain_module.dart';

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
      Iterable<CharacterTableData> charactersTable = characters.map((item) => item.fromCharacterToTableData()).toList();
      await batch((batch) => batch.insertAll(database.characterTable, charactersTable));
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
      return Future.error("error");
    }
    return list;
  }
}
