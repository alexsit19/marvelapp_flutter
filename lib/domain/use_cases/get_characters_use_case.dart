import 'package:dartz/dartz.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/error_handling/failure.dart';

class GetCharactersUseCase {
  final MarvellRepository repository;

  GetCharactersUseCase({required this.repository});

  Future<Either<Failure, List<Character>>> call(int offset, bool getFromLocal) => repository.getCharacters(offset, getFromLocal);
}
