// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_home.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultHome] {
///
/// {[List<Character>]? characters, [String]? errorString}
///
/// ([ResultHomeSuccess] success){[String]? errorString, [List<Character>] characters} with data equality
///
/// ([ResultHomeError] error){[List<Character>]? characters, [String]? errorString} with data equality
///
/// }
@SealedManifest(_ResultHome)
abstract class ResultHome {
  const ResultHome._internal();

  List<Character>? get characters;

  String? get errorString;

  const factory ResultHome.success({
    String? errorString,
    required List<Character> characters,
  }) = ResultHomeSuccess;

  const factory ResultHome.error({
    List<Character>? characters,
    String? errorString,
  }) = ResultHomeError;

  bool get isSuccess => this is ResultHomeSuccess;

  bool get isError => this is ResultHomeError;

  ResultHomeSuccess get asSuccess => this as ResultHomeSuccess;

  ResultHomeError get asError => this as ResultHomeError;

  ResultHomeSuccess? get asSuccessOrNull {
    final resultHome = this;
    return resultHome is ResultHomeSuccess ? resultHome : null;
  }

  ResultHomeError? get asErrorOrNull {
    final resultHome = this;
    return resultHome is ResultHomeError ? resultHome : null;
  }

  R when<R extends Object?>({
    required R Function(String? errorString, List<Character> characters)
        success,
    required R Function(List<Character>? characters, String? errorString) error,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      return success(resultHome.errorString, resultHome.characters);
    } else if (resultHome is ResultHomeError) {
      return error(resultHome.characters, resultHome.errorString);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String? errorString, List<Character> characters)? success,
    R Function(List<Character>? characters, String? errorString)? error,
    required R Function(ResultHome resultHome) orElse,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      return success != null
          ? success(resultHome.errorString, resultHome.characters)
          : orElse(resultHome);
    } else if (resultHome is ResultHomeError) {
      return error != null
          ? error(resultHome.characters, resultHome.errorString)
          : orElse(resultHome);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(String? errorString, List<Character> characters)? success,
    void Function(List<Character>? characters, String? errorString)? error,
    void Function(ResultHome resultHome)? orElse,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      if (success != null) {
        success(resultHome.errorString, resultHome.characters);
      } else if (orElse != null) {
        orElse(resultHome);
      }
    } else if (resultHome is ResultHomeError) {
      if (error != null) {
        error(resultHome.characters, resultHome.errorString);
      } else if (orElse != null) {
        orElse(resultHome);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(String? errorString, List<Character> characters)? success,
    R Function(List<Character>? characters, String? errorString)? error,
    R Function(ResultHome resultHome)? orElse,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      return success != null
          ? success(resultHome.errorString, resultHome.characters)
          : orElse?.call(resultHome);
    } else if (resultHome is ResultHomeError) {
      return error != null
          ? error(resultHome.characters, resultHome.errorString)
          : orElse?.call(resultHome);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(ResultHomeSuccess success) success,
    required R Function(ResultHomeError error) error,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      return success(resultHome);
    } else if (resultHome is ResultHomeError) {
      return error(resultHome);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(ResultHomeSuccess success)? success,
    R Function(ResultHomeError error)? error,
    required R Function(ResultHome resultHome) orElse,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      return success != null ? success(resultHome) : orElse(resultHome);
    } else if (resultHome is ResultHomeError) {
      return error != null ? error(resultHome) : orElse(resultHome);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(ResultHomeSuccess success)? success,
    void Function(ResultHomeError error)? error,
    void Function(ResultHome resultHome)? orElse,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      if (success != null) {
        success(resultHome);
      } else if (orElse != null) {
        orElse(resultHome);
      }
    } else if (resultHome is ResultHomeError) {
      if (error != null) {
        error(resultHome);
      } else if (orElse != null) {
        orElse(resultHome);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(ResultHomeSuccess success)? success,
    R Function(ResultHomeError error)? error,
    R Function(ResultHome resultHome)? orElse,
  }) {
    final resultHome = this;
    if (resultHome is ResultHomeSuccess) {
      return success != null ? success(resultHome) : orElse?.call(resultHome);
    } else if (resultHome is ResultHomeError) {
      return error != null ? error(resultHome) : orElse?.call(resultHome);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultHomeSuccess] : [ResultHome]) success){[String]? errorString, [List<Character>] characters}
///
/// with data equality
class ResultHomeSuccess extends ResultHome with EquatableMixin {
  const ResultHomeSuccess({
    this.errorString,
    required this.characters,
  }) : super._internal();

  @override
  final String? errorString;
  @override
  final List<Character> characters;

  @override
  String toString() =>
      'ResultHome.success(errorString: $errorString, characters: $characters)';

  @override
  List<Object?> get props => [
        errorString,
        characters,
      ];
}

/// (([ResultHomeError] : [ResultHome]) error){[List<Character>]? characters, [String]? errorString}
///
/// with data equality
class ResultHomeError extends ResultHome with EquatableMixin {
  const ResultHomeError({
    this.characters,
    this.errorString,
  }) : super._internal();

  @override
  final List<Character>? characters;
  @override
  final String? errorString;

  @override
  String toString() =>
      'ResultHome.error(characters: $characters, errorString: $errorString)';

  @override
  List<Object?> get props => [
        characters,
        errorString,
      ];
}
