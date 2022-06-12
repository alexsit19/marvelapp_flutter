import 'package:dartz/dartz.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/domain/error_handling/failure.dart';

class GetSeriesWithCharacterUseCase {
  final MarvellRepository repository;

  GetSeriesWithCharacterUseCase({required this.repository});

  Future<Either<Failure, List<Series>>> call(String characterId) => repository.getSeries(characterId);
}
