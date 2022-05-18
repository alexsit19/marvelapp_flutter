import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class CharacterMapper {
  static CharacterViewData toCharacterViewData(Character character) {
    return CharacterViewData(
        id: character.id,
        name: character.name,
        thumbnailUrl: character.thumbnailUrl,
        description: character.description);
  }
}
