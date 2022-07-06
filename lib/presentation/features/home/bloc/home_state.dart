import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

enum Loading { fullScreen, nextPage, loaded }

class HomeState extends Equatable {
  final Loading loading;
  final bool hasReachedMax;
  final Exception? error;
  final List<CharacterViewData> characters;

  const HomeState({
    required this.loading,
    this.hasReachedMax = false,
    this.error,
    this.characters = const <CharacterViewData>[],
  });

  HomeState copyWith({
    required Loading loading,
    bool? hasReachedMax,
    Exception? error,
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
