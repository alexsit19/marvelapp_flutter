import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';

class GetCharactersUseCase {
  final MarvellRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<List<Character>> call(int offset) => repository.getCharacters(offset);
}
