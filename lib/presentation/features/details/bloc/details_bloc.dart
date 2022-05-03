import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final MarvellRepository repository;

  DetailsBloc({required this.repository}) : super(const DetailsState(loading: true)) {
    on<GetCharacterDetail>(_mapGetCharacterEventToState);
  }

  Future<void> _mapGetCharacterEventToState(GetCharacterDetail event, Emitter<DetailsState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final character = await repository.getCharacterDetail(event.characterId);
      final series = await repository.getSeries(event.characterId);
      emit(state.copyWith(
        loading: false,
        character: character,
        series: series,
        error: null,
      ));
    } catch (error, stacktrace) {
      emit(state.copyWith(loading: false, error: error.toString()));
    }
  }
}
