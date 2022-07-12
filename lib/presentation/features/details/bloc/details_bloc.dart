import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/converters/to_character_view_data.dart';
import 'package:marvelapp_flutter/presentation/converters/to_series_view_data.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_state.dart';
import 'package:domain/domain_module.dart';

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
    } on DataRetrieveException catch(error) {
      emit(state.copyWith(loading: false, error: error));
    } on NoConnectionException catch(error) {
      emit(state.copyWith(loading: false, error: error));
    } catch (error) {
       rethrow;
    }
  }
}
