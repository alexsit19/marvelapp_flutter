import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/error_handling/exceptions.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_character_use_case.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_series_with_character_use_case.dart';
import 'package:marvelapp_flutter/presentation/converters/to_character_view_data.dart';
import 'package:marvelapp_flutter/presentation/converters/to_series_view_data.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetCharacterUseCase getCharacterUseCase;
  final GetSeriesWithCharacterUseCase getSeriesUseCase;

  DetailsBloc(
      {required this.getCharacterUseCase, required this.getSeriesUseCase})
      : super(const DetailsState(loading: true)) {
    on<GetCharacterDetail>(_mapGetCharacterEventToState);
  }

  Future<void> _mapGetCharacterEventToState(
      GetCharacterDetail event, Emitter<DetailsState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final character = await getCharacterUseCase(event.characterId);
      final series = await getSeriesUseCase(event.characterId);
      var characterViewData = character.toCharacterViewData();
      var seriesViewData =
      series.map((item) => item.toSeriesViewData()).toList();
      emit(state.copyWith(
          loading: false,
          character: characterViewData,
          series: seriesViewData,
          error: null));
    } on DataRetrieveException {
      emit(state.copyWith(loading: false, error: "slow internet connection"));
    } on NoConnectionException {
      emit(state.copyWith(loading: false, error: "no internet connection"));
    } catch (error) {
      emit(state.copyWith(loading: false, error: "unknown error"));
    }
  }
}
