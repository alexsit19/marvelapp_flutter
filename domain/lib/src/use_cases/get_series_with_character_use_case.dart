import 'package:domain/domain_module.dart';

class GetSeriesWithCharacterUseCase {
  final MarvellRepository repository;

  GetSeriesWithCharacterUseCase({required this.repository});

  Future<List<Series>> call(String characterId) => repository.getSeries(characterId);
}
