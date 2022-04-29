import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/screens/details_screen/bloc/details_screen_event.dart';
import 'package:marvelapp_flutter/presentation/screens/details_screen/bloc/details_screen_state.dart';

class DetailsScreenBloc extends Bloc<DetailsScreenEvent, DetailsScreenState> {
  final MarvellRepository repository;
  final String characterId;

  DetailsScreenBloc({required this.repository, required this.characterId})
      : super(const DetailsScreenState(loading: true)) {
    on<GetCharacterDetail>(_mapGetCharacterEventToState);
  }

  Future<void> _mapGetCharacterEventToState(GetCharacterDetail event, Emitter<DetailsScreenState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final character = await repository.getCharacterDetail(characterId);
      final series = await repository.getSeries(characterId);
      emit(state.copyWith(
        loading: false,
        character: character,
        series: series,
        error: null,
      ));
    } catch (error, stacktrace) {
      print("error");
      emit(state.copyWith(loading: false, error: error.toString()));
    }
  }
}
