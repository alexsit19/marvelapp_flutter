// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_details.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultDetails] {
///
/// ([ResultDetailsSuccess] success){[Character] character} with data equality
///
/// ([ResultDetailsError] error){[String] error} with data equality
///
/// }
@SealedManifest(_ResultDetails)
abstract class ResultDetails {
  const ResultDetails._internal();

  const factory ResultDetails.success({
    required Character character,
  }) = ResultDetailsSuccess;

  const factory ResultDetails.error({
    required String error,
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
    required R Function(Character character) success,
    required R Function(String error) error,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success(resultDetails.character);
    } else if (resultDetails is ResultDetailsError) {
      return error(resultDetails.error);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Character character)? success,
    R Function(String error)? error,
    required R Function(ResultDetails resultDetails) orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success != null
          ? success(resultDetails.character)
          : orElse(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error != null ? error(resultDetails.error) : orElse(resultDetails);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Character character)? success,
    void Function(String error)? error,
    void Function(ResultDetails resultDetails)? orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      if (success != null) {
        success(resultDetails.character);
      } else if (orElse != null) {
        orElse(resultDetails);
      }
    } else if (resultDetails is ResultDetailsError) {
      if (error != null) {
        error(resultDetails.error);
      } else if (orElse != null) {
        orElse(resultDetails);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Character character)? success,
    R Function(String error)? error,
    R Function(ResultDetails resultDetails)? orElse,
  }) {
    final resultDetails = this;
    if (resultDetails is ResultDetailsSuccess) {
      return success != null
          ? success(resultDetails.character)
          : orElse?.call(resultDetails);
    } else if (resultDetails is ResultDetailsError) {
      return error != null
          ? error(resultDetails.error)
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

/// (([ResultDetailsSuccess] : [ResultDetails]) success){[Character] character}
///
/// with data equality
class ResultDetailsSuccess extends ResultDetails with EquatableMixin {
  const ResultDetailsSuccess({
    required this.character,
  }) : super._internal();

  final Character character;

  @override
  String toString() => 'ResultDetails.success(character: $character)';

  @override
  List<Object?> get props => [
        character,
      ];
}

/// (([ResultDetailsError] : [ResultDetails]) error){[String] error}
///
/// with data equality
class ResultDetailsError extends ResultDetails with EquatableMixin {
  const ResultDetailsError({
    required this.error,
  }) : super._internal();

  final String error;

  @override
  String toString() => 'ResultDetails.error(error: $error)';

  @override
  List<Object?> get props => [
        error,
      ];
}
