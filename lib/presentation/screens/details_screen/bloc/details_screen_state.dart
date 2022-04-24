import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';
import '../../../../data/model/response_models/character.dart';

enum DetailsScreenStatus { initial, loading, success, error }

class DetailsScreenState extends Equatable {
  final DetailsScreenStatus status;
  final Character character;
  final List<Series> series;

  const DetailsScreenState(
      {this.status = DetailsScreenStatus.initial,
      this.character = const Character(
          id: null,
          name: null,
          thumbnailPath: null,
          thumbnailExtension: null,
          description: null),
      this.series = const <Series>[]});

  DetailsScreenState copyWith(
      {DetailsScreenStatus? status,
      Character? character,
      List<Series>? series}) {
    return DetailsScreenState(
        status: status ?? this.status,
        character: character ?? this.character,
        series: series ?? this.series);
  }

  @override
  List<Object?> get props => [status, character, series];
}
