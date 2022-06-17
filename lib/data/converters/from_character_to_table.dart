import 'package:marvelapp_flutter/data/data_sources/local/database/database.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

extension FromCharacterToTableData on Character {
  CharacterTableData fromCharacterToTableData() {
    return CharacterTableData(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
