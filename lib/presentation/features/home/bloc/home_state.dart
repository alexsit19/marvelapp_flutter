import 'package:equatable/equatable.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/error_object.dart';

enum Loading { fullScreen, inBottomRow, loaded }

class HomeState extends Equatable {
  final Loading loading;
  final bool hasReachedMax;
  final ErrorObject? errorObject;
  final List<CharacterViewData> characters;

  const HomeState({
    required this.loading,
    this.hasReachedMax = false,
    this.errorObject,
    this.characters = const <CharacterViewData>[],
  });

  HomeState copyWith({
    required Loading loading,
    bool? hasReachedMax,
    ErrorObject? errorObject,
    List<CharacterViewData>? characters,
  }) {
    return HomeState(
      loading: loading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      characters: characters ?? this.characters,
      errorObject: errorObject,
    );
  }

  @override
  List<Object?> get props => [loading, hasReachedMax, characters, errorObject];
}
