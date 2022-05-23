import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/extensions/to_character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharactersUseCase getCharactersUseCase;

  HomeBloc({required this.getCharactersUseCase}) : super(const HomeState(loading: true)) {
    on<GetHeroes>(_mapGetHeroesEventToState);
  }

  Future<void> _mapGetHeroesEventToState(GetHeroes event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      print("Length: ${state.characters?.length}");
      final characters = await getCharactersUseCase(state.characters?.length ?? 0);
      final charactersViewData = characters.map((item) => item.toCharacterViewData()).toList();
      if (state.characters != null) {
        List<CharacterViewData> list = List.of(state.characters!)..addAll(charactersViewData);
        emit(
          state.copyWith(loading: false, characters: list, error: null),
        );
      } else {
        emit(
          state.copyWith(
            loading: false,
            characters: charactersViewData,
            error: null,
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(loading: false, error: error.toString()));
    }
  }
}
