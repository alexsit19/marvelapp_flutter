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

    setUp(() {
      EquatableConfig.stringify = true;
      getCharactersUseCase = GetCharactersUseCase(repository: mockRepository);
      homeBloc = HomeBloc(getCharactersUseCase: getCharactersUseCase);
    });

    blocTest<HomeBloc, HomeState>(
      'First Screen launch when list of heroes is empty',
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
      'When list scrolled to bottom loading is shown and new page is requested',
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
      'When all heroes is downloaded and requested lust page ',
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
      'When lust page is downloaded and user scrolled to end again',
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

    blocTest<HomeBloc, HomeState>(
        'When repository throw DataRetrieveException',
        build: () => homeBloc,
        act: (homeBloc) {
          mockRepository.noConnectionException = false;
          mockRepository.dataRetrieveException = true;
          homeBloc.add(ScrolledToEnd());
        },
        verify: (_) {
          assert(homeBloc.state.error is DataRetrieveException);
        });

    blocTest<HomeBloc, HomeState>(
        'When repository throw NoConnectionException',
        build: () => homeBloc,
        act: (homeBloc) {
          mockRepository.dataRetrieveException = false;
          mockRepository.noConnectionException = true;
          homeBloc.add(ScrolledToEnd());
        },
        verify: (_) {
          assert(homeBloc.state.error is NoConnectionException);
        });

    tearDown(() => homeBloc.close());
  });
}
