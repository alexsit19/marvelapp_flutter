import 'package:marvelapp_flutter/data/data_sources/local/database/database.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

extension FromTableTOCHaracter on CharacterTableData {
  Character fromTableToCharacter() {
    return Character(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
      description: null,
    );
  }
}
