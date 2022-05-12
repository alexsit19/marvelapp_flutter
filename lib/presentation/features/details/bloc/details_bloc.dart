import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_character_by_id_use_case.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_series_by_id_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetCharacterByIdUseCase getCharacterByIdUseCase;
  final GetSeriesByIdUseCase getSeriesByIdUseCase;

  DetailsBloc({required this.getCharacterByIdUseCase, required this.getSeriesByIdUseCase})
      : super(const DetailsState(loading: true)) {
    on<GetCharacterDetail>(_mapGetCharacterEventToState);
  }

  Future<void> _mapGetCharacterEventToState(GetCharacterDetail event, Emitter<DetailsState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final character = await getCharacterByIdUseCase(event.characterId);
      final series = await getSeriesByIdUseCase(event.characterId);
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
