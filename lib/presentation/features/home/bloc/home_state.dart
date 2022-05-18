import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

class HomeState extends Equatable {
  final bool loading;
  final String? error;
  final List<CharacterViewData>? characters;

  const HomeState({
    required this.loading,
    this.error,
    this.characters,
  });

  HomeState copyWith({
    required bool loading,
    String? error,
    List<CharacterViewData>? characters,
  }) {
    return HomeState(
      loading: loading,
      characters: characters ?? this.characters,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, characters, error];
}
