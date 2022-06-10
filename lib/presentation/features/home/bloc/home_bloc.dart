import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/converters/to_character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharactersUseCase getCharactersUseCase;

  HomeBloc({required this.getCharactersUseCase}) : super(const HomeState(loading: false)) {
    on<ReadyForData>(_mapReadyForDataEventToState);
    on<ScrolledToEnd>(_mapScrolledToEndEventToState);
  }

  Future<void> _mapReadyForDataEventToState(ReadyForData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      var resultHome = await getCharactersUseCase(0, true);

      final charactersViewDataFromDataBase = resultHome.characters?.map((item) => item.toCharacterViewData()).toList();
      emit(
        state.copyWith(loading: false, characters: charactersViewDataFromDataBase, error: resultHome.errorString),
      );

      resultHome = await getCharactersUseCase(0, false);
      final charactersViewDataFromNetwork = resultHome.characters?.map((item) => item.toCharacterViewData()).toList();
      emit(
        state.copyWith(loading: false, characters: charactersViewDataFromNetwork, error: resultHome.errorString),
      );

    } catch (error) {
      emit(state.copyWith(loading: false, error: error.toString()));
    }
  }

  Future<void> _mapScrolledToEndEventToState(ScrolledToEnd event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax || state.loading) return;
    emit(state.copyWith(loading: true, error: null));
    try {
      final resultHome = await getCharactersUseCase(state.characters.length, false);

      if (resultHome.characters!.isEmpty) {
        emit(state.copyWith(loading: false, hasReachedMax: true));
        return;
      }
      final charactersViewData = resultHome.characters?.map((item) => item.toCharacterViewData()).toList();
      if (charactersViewData?.first.id == state.characters.first.id) {
        emit(state.copyWith(loading: false, error: null));
        return;
      }
      List<CharacterViewData> list = List.of(state.characters)..addAll(charactersViewData!);
      print("errorString = ${resultHome.errorString}");
      emit(
        state.copyWith(loading: false, characters: list, error: resultHome.errorString),
      );
    } catch (error) {
      emit(state.copyWith(loading: false, error: error.toString()));
    }
  }
}
