// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_series.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [ResultSeries] {
///
/// {[List<Series>]? series, [String]? errorString}
///
/// ([ResultSeriesSuccess] success){[String]? errorString, [List<Series>] series} with data equality
///
/// ([ResultSeriesError] error){[List<Series>]? series, [String]? errorString} with data equality
///
/// }
@SealedManifest(_ResultSeries)
abstract class ResultSeries {
  const ResultSeries._internal();

  List<Series>? get series;

  String? get errorString;

  const factory ResultSeries.success({
    String? errorString,
    required List<Series> series,
  }) = ResultSeriesSuccess;

  const factory ResultSeries.error({
    List<Series>? series,
    String? errorString,
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
    required R Function(String? errorString, List<Series> series) success,
    required R Function(List<Series>? series, String? errorString) error,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success(resultSeries.errorString, resultSeries.series);
    } else if (resultSeries is ResultSeriesError) {
      return error(resultSeries.series, resultSeries.errorString);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(String? errorString, List<Series> series)? success,
    R Function(List<Series>? series, String? errorString)? error,
    required R Function(ResultSeries resultSeries) orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success != null
          ? success(resultSeries.errorString, resultSeries.series)
          : orElse(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error != null
          ? error(resultSeries.series, resultSeries.errorString)
          : orElse(resultSeries);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(String? errorString, List<Series> series)? success,
    void Function(List<Series>? series, String? errorString)? error,
    void Function(ResultSeries resultSeries)? orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      if (success != null) {
        success(resultSeries.errorString, resultSeries.series);
      } else if (orElse != null) {
        orElse(resultSeries);
      }
    } else if (resultSeries is ResultSeriesError) {
      if (error != null) {
        error(resultSeries.series, resultSeries.errorString);
      } else if (orElse != null) {
        orElse(resultSeries);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(String? errorString, List<Series> series)? success,
    R Function(List<Series>? series, String? errorString)? error,
    R Function(ResultSeries resultSeries)? orElse,
  }) {
    final resultSeries = this;
    if (resultSeries is ResultSeriesSuccess) {
      return success != null
          ? success(resultSeries.errorString, resultSeries.series)
          : orElse?.call(resultSeries);
    } else if (resultSeries is ResultSeriesError) {
      return error != null
          ? error(resultSeries.series, resultSeries.errorString)
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

/// (([ResultSeriesSuccess] : [ResultSeries]) success){[String]? errorString, [List<Series>] series}
///
/// with data equality
class ResultSeriesSuccess extends ResultSeries with EquatableMixin {
  const ResultSeriesSuccess({
    this.errorString,
    required this.series,
  }) : super._internal();

  @override
  final String? errorString;
  @override
  final List<Series> series;

  @override
  String toString() =>
      'ResultSeries.success(errorString: $errorString, series: $series)';

  @override
  List<Object?> get props => [
        errorString,
        series,
      ];
}

/// (([ResultSeriesError] : [ResultSeries]) error){[List<Series>]? series, [String]? errorString}
///
/// with data equality
class ResultSeriesError extends ResultSeries with EquatableMixin {
  const ResultSeriesError({
    this.series,
    this.errorString,
  }) : super._internal();

  @override
  final List<Series>? series;
  @override
  final String? errorString;

  @override
  String toString() =>
      'ResultSeries.error(series: $series, errorString: $errorString)';

  @override
  List<Object?> get props => [
        series,
        errorString,
      ];
}
