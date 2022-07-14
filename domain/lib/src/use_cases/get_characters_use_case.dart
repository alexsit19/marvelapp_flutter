import 'package:domain/domain_module.dart';

class GetCharactersUseCase {
  final MarvellRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<List<Character>> call(int offset) => repository.getCharacters(offset);
}

