import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class CharacterMapper {
  static CharacterViewData toCharacterViewData(Character character) {
    return CharacterViewData(
        id: character.id,
        name: character.name,
        thumbnailPath: character.thumbnailPath,
        thumbnailExtension: character.thumbnailExtension,
        description: character.description);
  }
}
