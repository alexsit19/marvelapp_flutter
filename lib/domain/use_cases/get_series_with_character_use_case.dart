import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/result_series.dart';

class GetSeriesWithCharacterUseCase {
  final MarvellRepository repository;

  GetSeriesWithCharacterUseCase({required this.repository});

  Future<ResultSeries> call(String characterId) => repository.getSeries(characterId);
}
