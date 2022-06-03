import 'package:drift/drift.dart';
import 'package:marvelapp_flutter/data/local/database/database.dart';
import 'package:marvelapp_flutter/data/local/database_tables/character_table.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [CharacterTable])
class CharacterDao extends DatabaseAccessor<Database> {

  final Database database;

  CharacterDao(this.database) : super(database);
}
