import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

class GetCharacterUseCase {
  final MarvellRepository repository;

  GetCharacterUseCase({required this.repository});

  Future<Character> call(String characterId) => repository.getCharacterDetail(characterId);
}
