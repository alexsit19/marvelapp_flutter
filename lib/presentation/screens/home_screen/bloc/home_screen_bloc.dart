import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:marvelapp_flutter/presentation/screens/home_screen/bloc/home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final MarvellRepository repository;

  HomeScreenBloc({required this.repository}) : super(const HomeScreenState()) {
    on<GetHeroes>(_mapGetHeroesEventToState);
  }

  void _mapGetHeroesEventToState(
      GetHeroes event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(status: HomeScreenStatus.loading));
    try {
      final characters = await repository.getCharacters();
      emit(
        state.copyWith(
          status: HomeScreenStatus.success,
          characters: characters,
        ),
      );
    } catch (error, stacktrace) {
      emit(state.copyWith(status: HomeScreenStatus.error));
    }
  }
}
