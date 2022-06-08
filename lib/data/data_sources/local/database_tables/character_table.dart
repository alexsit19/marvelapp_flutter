import 'package:drift/drift.dart';

class CharacterTable extends Table {
  IntColumn get id => integer().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get thumbnailUrl => text().nullable()();
}
