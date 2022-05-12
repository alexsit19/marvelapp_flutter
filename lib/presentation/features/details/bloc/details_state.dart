import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';

@immutable
class DetailsState extends Equatable {
  final bool loading;
  final Character? character;
  final String? error;
  final List<Series>? series;

  const DetailsState({
    required this.loading,
    this.character,
    this.error,
    this.series,
  });

  DetailsState copyWith({
    required bool loading,
    Character? character,
    String? error,
    List<Series>? series,
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
