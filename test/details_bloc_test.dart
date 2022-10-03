import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain_module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_state.dart';
import 'mock_repository.dart';

void main() {
  group('DetailsBlocTest', () {
    late DetailsBloc detailsBloc;
    MockRepository mockRepository = MockRepository();
    GetCharacterUseCase getCharactersUseCase;
    GetSeriesWithCharacterUseCase getSeriesWithCharacterUseCase;

    setUp(() {
      EquatableConfig.stringify = true;
      getSeriesWithCharacterUseCase = GetSeriesWithCharacterUseCase(repository: mockRepository);
      getCharactersUseCase = GetCharacterUseCase(repository: mockRepository);
      detailsBloc =
          DetailsBloc(getCharacterUseCase: getCharactersUseCase, getSeriesUseCase: getSeriesWithCharacterUseCase);
    });

    blocTest<DetailsBloc, DetailsState>(
      'Request character data',
      build: () => detailsBloc,
      act: (detailsBloc) => detailsBloc.add(GetCharacterDetail(characterId: '1')),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        DetailsState(
          loading: true,
          character: null,
          series: null,
          error: null,
        ),
        DetailsState(
          loading: false,
          character: mockCharactersViewData[1],
          series: mockSeriesViewData,
          error: null,
        ),
      ],
    );

    blocTest<DetailsBloc, DetailsState>('When repository throw DataRetrieveException',
        build: () => detailsBloc,
        act: (detailsBloc) {
          mockRepository.noConnectionException = false;
          mockRepository.dataRetrieveException = true;
          detailsBloc.add(GetCharacterDetail(characterId: '1'));
        },
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          assert(detailsBloc.state.error is DataRetrieveException);
        });

    blocTest<DetailsBloc, DetailsState>('When repository throw NoConnectionException',
        build: () => detailsBloc,
        act: (detailsBloc) {
          mockRepository.dataRetrieveException = false;
          mockRepository.noConnectionException = true;
          detailsBloc.add(GetCharacterDetail(characterId: '1'));
        },
        wait: const Duration(milliseconds: 300),
        verify: (_) {
          assert(detailsBloc.state.error is NoConnectionException);
        });
  });
}
