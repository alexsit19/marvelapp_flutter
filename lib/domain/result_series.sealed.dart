// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_series.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultSeries] {
///
/// ([ResultSeriesSuccess] success){[List<Series>] series} with data equality
///
/// ([ResultSeriesError] error){[String] error} with data equality
///
/// }
@SealedManifest(_ResultSeries)
abstract class ResultSeries {
  const ResultSeries._internal();

  const factory ResultSeries.success({
    required List<Series> series,
  }) = ResultSeriesSuccess;

  const factory ResultSeries.error({
    required String error,
  }) = ResultSeriesError;

  bool get isSuccess => this is ResultSeriesSuccess;

  bool get isError => this is ResultSeriesError;

  ResultSeriesSuccess get asSuccess => this as ResultSeriesSuccess;

  ResultSeriesError get asError => this as ResultSeriesError;

  ResultSeriesSuccess? get asSuccessOrNull {
    final resultSeries = this;
    return resultSeries is ResultSeriesSuccess ? resultSeries : null;
  }

  ResultSeriesError? get asErrorOrNull {
    final resultSeries = this;
    return resultSeries is ResultSeriesError ? resultSeries : null;
  }

  R when<R extends Object?>({
    required R Function(List<Series> series) success,
    required R Function(String error) error,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success(resultSeries.series);
    } else if (resultSeries is ResultSeriesError) {
      return error(resultSeries.error);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(List<Series> series)? success,
    R Function(String error)? error,
    required R Function(ResultSeries resultSeries) orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success != null
          ? success(resultSeries.series)
          : orElse(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error != null ? error(resultSeries.error) : orElse(resultSeries);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(List<Series> series)? success,
    void Function(String error)? error,
    void Function(ResultSeries resultSeries)? orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      if (success != null) {
        success(resultSeries.series);
      } else if (orElse != null) {
        orElse(resultSeries);
      }
    } else if (resultSeries is ResultSeriesError) {
      if (error != null) {
        error(resultSeries.error);
      } else if (orElse != null) {
        orElse(resultSeries);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(List<Series> series)? success,
    R Function(String error)? error,
    R Function(ResultSeries resultSeries)? orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success != null
          ? success(resultSeries.series)
          : orElse?.call(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error != null
          ? error(resultSeries.error)
          : orElse?.call(resultSeries);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(ResultSeriesSuccess success) success,
    required R Function(ResultSeriesError error) error,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error(resultSeries);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(ResultSeriesSuccess success)? success,
    R Function(ResultSeriesError error)? error,
    required R Function(ResultSeries resultSeries) orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success != null ? success(resultSeries) : orElse(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error != null ? error(resultSeries) : orElse(resultSeries);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(ResultSeriesSuccess success)? success,
    void Function(ResultSeriesError error)? error,
    void Function(ResultSeries resultSeries)? orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      if (success != null) {
        success(resultSeries);
      } else if (orElse != null) {
        orElse(resultSeries);
      }
    } else if (resultSeries is ResultSeriesError) {
      if (error != null) {
        error(resultSeries);
      } else if (orElse != null) {
        orElse(resultSeries);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(ResultSeriesSuccess success)? success,
    R Function(ResultSeriesError error)? error,
    R Function(ResultSeries resultSeries)? orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success != null
          ? success(resultSeries)
          : orElse?.call(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error != null ? error(resultSeries) : orElse?.call(resultSeries);
    } else {
      throw AssertionError();
    }
  }
}

/// (([ResultSeriesSuccess] : [ResultSeries]) success){[List<Series>] series}
///
/// with data equality
class ResultSeriesSuccess extends ResultSeries with EquatableMixin {
  const ResultSeriesSuccess({
    required this.series,
  }) : super._internal();

  final List<Series> series;

  @override
  String toString() => 'ResultSeries.success(series: $series)';

  @override
  List<Object?> get props => [
        series,
      ];
}

/// (([ResultSeriesError] : [ResultSeries]) error){[String] error}
///
/// with data equality
class ResultSeriesError extends ResultSeries with EquatableMixin {
  const ResultSeriesError({
    required this.error,
  }) : super._internal();

  final String error;

  @override
  String toString() => 'ResultSeries.error(error: $error)';

  @override
  List<Object?> get props => [
        error,
      ];
}
