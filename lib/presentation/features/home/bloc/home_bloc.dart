import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/error_handling/exceptions.dart';
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
      var characters = await getCharactersUseCase(0);
      var characterViewData = characters.map((item) => item.toCharacterViewData()).toList();
      emit(state.copyWith(loading: false, characters: characterViewData, error: null));
    } on DataParsingException {
      emit(state.copyWith(loading: false, error: "data parsing exception"));
    } on DataRetrieveException {
      emit(state.copyWith(loading: false, error: "data retrieve exception"));
    } on NoConnectionException {
      emit(state.copyWith(loading: false, error: "no connection exception"));
    } catch (error) {
      emit(state.copyWith(loading: false, error: "unknown exception"));
    }
  }

  Future<void> _mapScrolledToEndEventToState(ScrolledToEnd event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax || state.loading) return;
    emit(state.copyWith(loading: true, error: null));
    try {
      var characters = await getCharactersUseCase(state.characters.length);
      if (characters.isEmpty) {
        emit(state.copyWith(loading: false, hasReachedMax: true));
        return;
      }
      var characterViewData = characters.map((item) => item.toCharacterViewData()).toList();
      List<CharacterViewData> list = List.of(state.characters)..addAll(characterViewData);
      emit(state.copyWith(loading: false, characters: list, error: null));
    } on DataParsingException {
      emit(state.copyWith(loading: false, error: "data parsing exception"));
    } on DataRetrieveException {
      emit(state.copyWith(loading: false, error: "data retrieve exception"));
    } on NoConnectionException {
      emit(state.copyWith(loading: false, error: "no connection exception"));
    } catch (error) {
      emit(state.copyWith(loading: false, error: "unknown exception"));
    }
  }
}
