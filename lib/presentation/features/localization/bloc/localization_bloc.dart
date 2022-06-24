import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_event.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationState(locale: CurrentLocale.en)) {
    on<SetLocalRu>(_mapSetLocaleRuEventToState);
    on<SetLocalEn>(_mapSetLocaleEnEventToState);
  }

  void _mapSetLocaleRuEventToState(LocalizationEvent event, Emitter<LocalizationState> emit) {
    emit(state.copyWith(locale: CurrentLocale.ru));
  }

  void _mapSetLocaleEnEventToState(LocalizationEvent event, Emitter<LocalizationState> emit) {
    emit(state.copyWith(locale: CurrentLocale.en));
  }
}
