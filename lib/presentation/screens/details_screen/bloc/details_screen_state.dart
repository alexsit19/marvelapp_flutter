import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';
import '../../../../data/model/response_models/character.dart';

@immutable
class DetailsScreenState extends Equatable {
  final bool loading;
  final Character? character;
  final String? error;
  final List<Series>? series;

  const DetailsScreenState({
    required this.loading,
    this.character,
    this.error,
    this.series,
  });

  DetailsScreenState copyWith({
    required bool loading,
    Character? character,
    String? error,
    List<Series>? series,
  }) {
    return DetailsScreenState(
      loading: loading,
      character: character ?? this.character,
      series: series ?? this.series,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, character, series, error];
}
