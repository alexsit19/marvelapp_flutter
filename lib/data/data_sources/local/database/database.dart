import 'package:drift/drift.dart';
import 'package:marvelapp_flutter/data/data_sources/local/database_tables/character_table.dart';
import 'package:marvelapp_flutter/data/data_sources/local/dao/character_dao.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'database.g.dart';

@DriftDatabase(
  tables: [CharacterTable],
  daos: [CharacterDao],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'data.sqlite'));
    return NativeDatabase(file);
  });
}
