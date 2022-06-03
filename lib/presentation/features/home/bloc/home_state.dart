import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class HomeState extends Equatable {
  final bool loading;
  final bool hasReachedMax;
  final String? error;
  final List<CharacterViewData> characters;

  const HomeState({
    required this.loading,
    this.hasReachedMax = false,
    this.error,
    this.characters = const <CharacterViewData>[],
  });
//TODO возможно нужно добавить две переменные nextPageLoading и screenLoading для того чтобы разделить индикаторы загрузки
  //TODO нижний маленький и большой по центру
  HomeState copyWith({
    required bool loading,
    bool? hasReachedMax,
    String? error,
    List<CharacterViewData>? characters,
  }) {
    return HomeState(
      loading: loading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      characters: characters ?? this.characters,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, hasReachedMax, characters, error];
}
