import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';

class GetSeriesWithCharacterUseCase {
  final MarvellRepository repository;

  GetSeriesWithCharacterUseCase({required this.repository});

  Future<List<Series>> call(String characterId) => repository.getSeries(characterId);
}
