import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';

class HomeScreenState extends Equatable {
  final bool loading;
  final String? error;
  final List<Character>? characters;

  const HomeScreenState({
    required this.loading,
    this.error,
    this.characters,
  });

  HomeScreenState copyWith({
    required bool loading,
    String? error,
    List<Character>? characters,
  }) {
    return HomeScreenState(loading: loading, characters: characters ?? this.characters, error: error);
  }

  @override
  List<Object?> get props => [loading, characters, error];
}
