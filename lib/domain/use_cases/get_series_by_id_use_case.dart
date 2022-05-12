import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';

class GetSeriesByIdUseCase {
  final MarvellRepository _repository;

  GetSeriesByIdUseCase(this._repository);

  Future<List<Series>> call(String characterId) => _repository.getSeries(characterId);
}
