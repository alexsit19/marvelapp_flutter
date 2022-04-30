import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';

class HomeState extends Equatable {
  final bool loading;
  final String? error;
  final List<Character>? characters;

  const HomeState({
    required this.loading,
    this.error,
    this.characters,
  });

  HomeState copyWith({
    required bool loading,
    String? error,
    List<Character>? characters,
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
