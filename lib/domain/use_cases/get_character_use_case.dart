import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/result_details.dart';

class GetCharacterUseCase {
  final MarvellRepository repository;

  GetCharacterUseCase({required this.repository});

  Future<ResultDetails> call(String characterId) => repository.getCharacterDetail(characterId);
}
