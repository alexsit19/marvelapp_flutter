import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';

@immutable
class DetailsState extends Equatable {
  final bool loading;
  final CharacterViewData? character;
  final Object? error;
  final List<SeriesViewData>? series;

  const DetailsState({
    required this.loading,
    this.character,
    this.error,
    this.series,
  });

  DetailsState copyWith({
    required bool loading,
    CharacterViewData? character,
    Object? error,
    List<SeriesViewData>? series,
  }) {

    return DetailsState(
      loading: loading,
      character: character ?? this.character,
      series: series ?? this.series,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, character, series, error];
}
