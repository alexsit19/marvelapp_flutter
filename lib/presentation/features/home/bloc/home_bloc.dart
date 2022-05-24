import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/extensions/to_character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';


EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}
const throttleDuration = Duration(microseconds: 100);

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharactersUseCase getCharactersUseCase;

  HomeBloc({required this.getCharactersUseCase}) : super(const HomeState(loading: true, firstLoading: true)) {
    on<GetHeroes>(_mapGetHeroesEventToState,
    transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _mapGetHeroesEventToState(GetHeroes event, Emitter<HomeState> emit) async {
    if (state.characters == null) {
      emit(state.copyWith(loading: true, firstLoading: true));
    } else {
      emit(state.copyWith(loading: true, firstLoading: false, error: null));
    }

    try {
      print("Length: ${state.characters?.length}");
      final characters = await getCharactersUseCase(state.characters?.length ?? 0);
      final charactersViewData = characters.map((item) => item.toCharacterViewData()).toList();
      if (state.characters != null) {
        List<CharacterViewData> list = List.of(state.characters!)..addAll(charactersViewData);
        emit(
          state.copyWith(loading: false, firstLoading: false, characters: list, error: null),
        );
      } else {
        emit(
          state.copyWith(
            loading: false,
            firstLoading: false,
            characters: charactersViewData,
            error: null,
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(loading: false, firstLoading: false, error: error.toString()));
    }
  }
}
