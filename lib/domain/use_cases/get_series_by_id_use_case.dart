import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';

class GetSeriesByIdUseCase {
  final MarvellRepository repository;

  GetSeriesByIdUseCase({required this.repository});

  Future<List<Series>> call(String characterId) => repository.getSeries(characterId);
}
