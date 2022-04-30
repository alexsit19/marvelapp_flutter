import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_screen_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final MarvellRepository repository;

  HomeScreenBloc({required this.repository}) : super(const HomeScreenState(loading: true)) {
    on<GetHeroes>(_mapGetHeroesEventToState);
  }

  Future<void> _mapGetHeroesEventToState(GetHeroes event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final characters = await repository.getCharacters();
      emit(
        state.copyWith(
          loading: false,
          characters: characters,
          error: null,
        ),
      );
    } catch (error, stacktrace) {
      emit(state.copyWith(loading: false, error: error.toString()));
    }
  }
}
