import 'package:domain/domain_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_bloc.dart';

import 'mock_repository.dart';

void main() {
  group('DetailsBlocTest', () {
    late DetailsBloc detailBloc;
    MockRepository mockRepository = MockRepository();
    GetCharacterUseCase getCharactersUseCase;
    GetSeriesWithCharacterUseCase getSeriesWithCharacterUseCase;

    setUp(() {
      getSeriesWithCharacterUseCase = GetSeriesWithCharacterUseCase(repository: mockRepository);
      getCharactersUseCase = GetCharacterUseCase(repository: mockRepository);
      detailBloc =
          DetailsBloc(getCharacterUseCase: getCharactersUseCase, getSeriesUseCase: getSeriesWithCharacterUseCase);
    });
  });
}
