import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain_module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';

import 'mock_repository.dart';

void main() {
  group('HomeBlocTest', () {
    late HomeBloc homeBloc;
    MockRepository mockRepository = MockRepository();
    GetCharactersUseCase getCharactersUseCase;
    GetSeriesWithCharacterUseCase getSeriesWithCharacterUseCase;

    setUp(() {
      EquatableConfig.stringify = true;
      getCharactersUseCase = GetCharactersUseCase(repository: mockRepository);
      homeBloc = HomeBloc(getCharactersUseCase: getCharactersUseCase);
    });

    blocTest<HomeBloc, HomeState>(
      'ReadyForData test',
      build: () => homeBloc,
      act: (homeBloc) => homeBloc.add(ReadyForData()),
      expect: () => [
        HomeState(
          loading: Loading.fullScreen,
          hasReachedMax: false,
          characters: [],
          error: null,
        ),
        HomeState(
          loading: Loading.loaded,
          hasReachedMax: false,
          characters: mockCharactersViewData.getRange(0, 11).toList(),
          error: null,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'ScrollToEnd after ReadyForData',
      build: () => homeBloc,
      act: (homeBloc) => homeBloc.add(ScrolledToEnd()),
      seed: () => HomeState(
        loading: Loading.loaded,
        hasReachedMax: false,
        characters: mockCharactersViewData.getRange(0, 11).toList(),
        error: null,
      ),
      expect: () => [
        HomeState(
          loading: Loading.nextPage,
          hasReachedMax: false,
          characters: mockCharactersViewData.getRange(0, 11).toList(),
          error: null,
        ),
        HomeState(
          loading: Loading.loaded,
          hasReachedMax: false,
          characters: mockCharactersViewData.getRange(0, 22).toList(),
          error: null,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'End of List',
      build: () => homeBloc,
      act: (homeBloc) => homeBloc.add(ScrolledToEnd()),
      seed: () => HomeState(
        loading: Loading.loaded,
        hasReachedMax: false,
        characters: mockCharactersViewData.getRange(0, 22).toList(),
        error: null,
      ),
      expect: () => [
        HomeState(
          loading: Loading.nextPage,
          hasReachedMax: false,
          characters: mockCharactersViewData.getRange(0, 22).toList(),
          error: null,
        ),
        HomeState(
          loading: Loading.loaded,
          hasReachedMax: false,
          characters: mockCharactersViewData.getRange(0, 30).toList(),
          error: null,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'out of list',
      build: () => homeBloc,
      act: (homeBloc) => homeBloc.add(ScrolledToEnd()),
      seed: () => HomeState(
        loading: Loading.loaded,
        hasReachedMax: false,
        characters: mockCharactersViewData.getRange(0, 30).toList(),
        error: null,
      ),
      expect: () => [
        HomeState(
          loading: Loading.nextPage,
          hasReachedMax: false,
          characters: mockCharactersViewData.getRange(0, 30).toList(),
          error: null,
        ),
        HomeState(
          loading: Loading.loaded,
          hasReachedMax: true,
          characters: mockCharactersViewData.getRange(0, 30).toList(),
          error: null,
        ),
      ],
    );

    tearDown(() => homeBloc.close());
  });
}
