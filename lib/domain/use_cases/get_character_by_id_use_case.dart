import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';

class GetCharacterByIdUseCase {
  final MarvellRepository repository;

  GetCharacterByIdUseCase({required this.repository});

  Future<Character> call(String characterId) => repository.getCharacterDetail(characterId);
}
