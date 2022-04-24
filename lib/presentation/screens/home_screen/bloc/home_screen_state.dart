import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';

enum HomeScreenStatus { initial, loading, success, error }

class HomeScreenState extends Equatable {
  final HomeScreenStatus status;
  final List<Character> characters;

  const HomeScreenState({
    this.status = HomeScreenStatus.initial,
    this.characters = const <Character>[],
  });

  HomeScreenState copyWith({
    HomeScreenStatus? status,
    List<Character>? characters,
  }) {
    return HomeScreenState(
        status: status ?? this.status,
        characters: characters ?? this.characters);
  }

  @override
  List<Object?> get props => [status, characters];
}
