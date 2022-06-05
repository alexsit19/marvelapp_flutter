import 'package:marvelapp_flutter/data/local/database/database.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

extension ToCharacter on CharacterTableData {
  Character toCharacter() {
    return Character(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
      description: null,
    );
  }
}
