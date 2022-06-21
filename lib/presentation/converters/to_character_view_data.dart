import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

extension ToCharacterViewData on Character {
  CharacterViewData toCharacterViewData() {
    return CharacterViewData(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
      description: description,
    );
  }
}
