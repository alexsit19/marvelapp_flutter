import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/error_handling/exceptions.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/converters/to_character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharactersUseCase getCharactersUseCase;

  HomeBloc({required this.getCharactersUseCase}) : super(const HomeState(loading: Loading.fullScreen)) {
    on<ReadyForData>(_mapReadyForDataEventToState);
    on<ScrolledToEnd>(_mapScrolledToEndEventToState);
  }

  Future<void> _mapReadyForDataEventToState(ReadyForData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: Loading.fullScreen));
    try {
      var characters = await getCharactersUseCase(0);
      var characterViewData = characters.map((item) => item.toCharacterViewData()).toList();
      emit(state.copyWith(loading: Loading.loaded, characters: characterViewData, error: null));
    } on DataRetrieveException catch(error) {
      emit(state.copyWith(
          loading: Loading.loaded, error: error));
    } on NoConnectionException catch(error) {
      emit(state.copyWith(
          loading: Loading.loaded, error: error));
    } catch (error) {
      emit(state.copyWith(loading: Loading.loaded, error: error));
    }
  }

  Future<void> _mapScrolledToEndEventToState(ScrolledToEnd event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax || state.loading == Loading.inBottomRow) return;
    emit(state.copyWith(loading: Loading.inBottomRow, error: null));
    try {
      var characters = await getCharactersUseCase(state.characters.length);
      if (characters.isEmpty) {
        emit(state.copyWith(loading: Loading.loaded, hasReachedMax: true));
        return;
      }
      var characterViewData = characters.map((item) => item.toCharacterViewData()).toList();
      List<CharacterViewData> list = List.of(state.characters)..addAll(characterViewData);
      emit(state.copyWith(loading: Loading.loaded, characters: list, error: null));
    } on DataRetrieveException catch(error) {
      emit(state.copyWith(
          loading: Loading.loaded, error: error));
    } on NoConnectionException catch(error) {
      emit(state.copyWith(
          loading: Loading.loaded, error: error));
    } catch (error) {
      emit(state.copyWith(loading: Loading.loaded, error: error));
    }
  }
}
