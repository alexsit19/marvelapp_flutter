import 'package:domain/domain_module.dart';

class GetCharacterUseCase {
  final MarvellRepository repository;

  GetCharacterUseCase({required this.repository});

  Future<Character> call(String characterId) => repository.getCharacterDetail(characterId);
}
