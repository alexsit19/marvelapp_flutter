import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';

class GetCharacterByIdUseCase {
  final MarvellRepository _repository;

  GetCharacterByIdUseCase(this._repository);

  Future<Character> call(String characterId) => _repository.getCharacterDetail(characterId);
}
