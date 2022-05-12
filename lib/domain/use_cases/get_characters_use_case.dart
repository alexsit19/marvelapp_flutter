import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';

class GetCharactersUseCase {
  final MarvellRepository _repository;

  GetCharactersUseCase(this._repository);

  Future<List<Character>> call() => _repository.getCharacters();
}
