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
    emit(
      state.copyWith(loading: true),
    );
    List<CharacterViewData>? characters;
    var eitherCharacters = await getCharactersUseCase(0, true);
    eitherCharacters.fold(
      (failure) => emit(
        state.copyWith(loading: false, error: "error"),
      ),
      (charactersFromBase) {
        if (charactersFromBase.isEmpty) {
          emit(state.copyWith(loading: false, error: "error"));
          return;
        }
        characters = charactersFromBase
            .map(
              (item) => item.toCharacterViewData(),
            )
            .toList();
        emit(
          state.copyWith(loading: false, characters: characters, error: null),
        );
      },
    );

    eitherCharacters = await getCharactersUseCase(0, false);
    eitherCharacters.fold(
      (failure) => state.copyWith(loading: false, error: "error"),
      (charactersFromNetwork) {
        characters = charactersFromNetwork
            .map(
              (item) => item.toCharacterViewData(),
            )
            .toList();
        emit(
          state.copyWith(loading: false, characters: characters, error: null),
        );
      },
    );
  }

  Future<void> _mapScrolledToEndEventToState(ScrolledToEnd event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax || state.loading) return;
    emit(state.copyWith(loading: true, error: null));
    List<CharacterViewData> characters;
    var eitherCharacters = await getCharactersUseCase(state.characters.length, false);

    eitherCharacters.fold(
      (failure) => emit(
        state.copyWith(loading: false, error: "error"),
      ),
      (charactersFromNetwork) {
        if (charactersFromNetwork.isEmpty) {
          emit(
            state.copyWith(loading: false, hasReachedMax: true),
          );
          return;
        }
        characters = charactersFromNetwork.map((item) => item.toCharacterViewData()).toList();
        if (characters.first.id == state.characters.first.id) {
          emit(state.copyWith(loading: false, error: null));
          return;
        }
        List<CharacterViewData> list = List.of(state.characters)..addAll(characters);
        emit(
          state.copyWith(loading: false, characters: list, error: null),
        );
      },
    );
  }
}
