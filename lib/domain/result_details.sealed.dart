// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_details.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultDetails] {
///
/// {[Character]? character, [String]? errorString}
///
/// ([ResultDetailsSuccess] success){[String]? errorString, [Character] character} with data equality
///
/// ([ResultDetailsError] error){[Character]? character, [String]? errorString} with data equality
///
/// }
@SealedManifest(_ResultDetails)
abstract class ResultDetails {
  const ResultDetails._internal();

  Character? get character;

  String? get errorString;

  const factory ResultDetails.success({
    String? errorString,
    required Character character,
  }) = ResultDetailsSuccess;

  const factory ResultDetails.error({
    Character? character,
    String? errorString,
  }) = ResultDetailsError;

  bool get isSuccess => this is ResultDetailsSuccess;

  bool get isError => this is ResultDetailsError;

  ResultDetailsSuccess get asSuccess => this as ResultDetailsSuccess;

  ResultDetailsError get asError => this as ResultDetailsError;

  ResultDetailsSuccess? get asSuccessOrNull {
    final resultDetails = this;
    return resultDetails is ResultDetailsSuccess ? resultDetails : null;
  }

  ResultDetailsError? get asErrorOrNull {
    final resultDetails = this;
    return resultDetails is ResultDetailsError ? resultDetails : null;
  }

  R when<R extends Object?>({
    required R Function(String? errorString, Character character) success,
    required R Function(Character? character, String? errorString) error,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success(resultDetails.errorString, resultDetails.character);
    } else if (resultDetails is ResultDetailsError) {
      return error(resultDetails.character, resultDetails.errorString);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String? errorString, Character character)? success,
    R Function(Character? character, String? errorString)? error,
    required R Function(ResultDetails resultDetails) orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success != null
          ? success(resultDetails.errorString, resultDetails.character)
          : orElse(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error != null
          ? error(resultDetails.character, resultDetails.errorString)
          : orElse(resultDetails);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(String? errorString, Character character)? success,
    void Function(Character? character, String? errorString)? error,
    void Function(ResultDetails resultDetails)? orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      if (success != null) {
        success(resultDetails.errorString, resultDetails.character);
      } else if (orElse != null) {
        orElse(resultDetails);
      }
    } else if (resultDetails is ResultDetailsError) {
      if (error != null) {
        error(resultDetails.character, resultDetails.errorString);
      } else if (orElse != null) {
        orElse(resultDetails);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(String? errorString, Character character)? success,
    R Function(Character? character, String? errorString)? error,
    R Function(ResultDetails resultDetails)? orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success != null
          ? success(resultDetails.errorString, resultDetails.character)
          : orElse?.call(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error != null
          ? error(resultDetails.character, resultDetails.errorString)
          : orElse?.call(resultDetails);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(ResultDetailsSuccess success) success,
    required R Function(ResultDetailsError error) error,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error(resultDetails);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(ResultDetailsSuccess success)? success,
    R Function(ResultDetailsError error)? error,
    required R Function(ResultDetails resultDetails) orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success != null ? success(resultDetails) : orElse(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error != null ? error(resultDetails) : orElse(resultDetails);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(ResultDetailsSuccess success)? success,
    void Function(ResultDetailsError error)? error,
    void Function(ResultDetails resultDetails)? orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      if (success != null) {
        success(resultDetails);
      } else if (orElse != null) {
        orElse(resultDetails);
      }
    } else if (resultDetails is ResultDetailsError) {
      if (error != null) {
        error(resultDetails);
      } else if (orElse != null) {
        orElse(resultDetails);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(ResultDetailsSuccess success)? success,
    R Function(ResultDetailsError error)? error,
    R Function(ResultDetails resultDetails)? orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success != null
          ? success(resultDetails)
          : orElse?.call(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error != null ? error(resultDetails) : orElse?.call(resultDetails);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultDetailsSuccess] : [ResultDetails]) success){[String]? errorString, [Character] character}
///
/// with data equality
class ResultDetailsSuccess extends ResultDetails with EquatableMixin {
  const ResultDetailsSuccess({
    this.errorString,
    required this.character,
  }) : super._internal();

  @override
  final String? errorString;
  @override
  final Character character;

  @override
  String toString() =>
      'ResultDetails.success(errorString: $errorString, character: $character)';

  @override
  List<Object?> get props => [
        errorString,
        character,
      ];
}

/// (([ResultDetailsError] : [ResultDetails]) error){[Character]? character, [String]? errorString}
///
/// with data equality
class ResultDetailsError extends ResultDetails with EquatableMixin {
  const ResultDetailsError({
    this.character,
    this.errorString,
  }) : super._internal();

  @override
  final Character? character;
  @override
  final String? errorString;

  @override
  String toString() =>
      'ResultDetails.error(character: $character, errorString: $errorString)';

  @override
  List<Object?> get props => [
        character,
        errorString,
      ];
}
