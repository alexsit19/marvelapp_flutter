import 'package:drift/drift.dart';
import 'package:data/data_module.dart';
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
