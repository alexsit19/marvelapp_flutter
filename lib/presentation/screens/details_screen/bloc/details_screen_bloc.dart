import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/screens/details_screen/bloc/details_screen_event.dart';
import 'package:marvelapp_flutter/presentation/screens/details_screen/bloc/details_screen_state.dart';

class DetailsScreenBloc extends Bloc<DetailsScreenEvent, DetailsScreenState> {
  final MarvellRepository repository;
  final String characterId;

  DetailsScreenBloc({required this.repository, required this.characterId})
      : super(const DetailsScreenState()) {
    on<GetCharacterDetail>(_mapGetCharacterEventToState);
  }

  Future<void> _mapGetCharacterEventToState(
      GetCharacterDetail event, Emitter<DetailsScreenState> emit) async {
    emit(state.copyWith(status: DetailsScreenStatus.loading));
    try {
      final character = await repository.getCharacterDetail(characterId);
      final series = await repository.getSeries(characterId);
      emit(state.copyWith(
          status: DetailsScreenStatus.success,
          character: character,
          series: series));
    } catch (error, stacktrace) {
      emit(state.copyWith(status: DetailsScreenStatus.error));
    }
  }
}
