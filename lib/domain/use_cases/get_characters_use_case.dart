import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/result_home.dart';

class GetCharactersUseCase {
  final MarvellRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<ResultHome> call(int offset, bool getFromLocal) => repository.getCharacters(offset, getFromLocal);
}
