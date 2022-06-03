import 'package:drift/drift.dart';

class CharacterTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get thumbnailUrl => text()();
}
