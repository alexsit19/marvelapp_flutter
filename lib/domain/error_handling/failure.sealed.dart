// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Failure] {
///
/// ([FailureServerFailure] serverFailure){} with data equality
///
/// ([FailureConnectionFailure] connectionFailure){} with data equality
///
/// ([FailureDataParsingFailure] dataParsingFailure){} with data equality
///
/// }
@SealedManifest(_Failure)
abstract class Failure {
  const Failure._internal();

  const factory Failure.serverFailure() = FailureServerFailure;

  const factory Failure.connectionFailure() = FailureConnectionFailure;

  const factory Failure.dataParsingFailure() = FailureDataParsingFailure;

  bool get isServerFailure => this is FailureServerFailure;

  bool get isConnectionFailure => this is FailureConnectionFailure;

  bool get isDataParsingFailure => this is FailureDataParsingFailure;

  FailureServerFailure get asServerFailure => this as FailureServerFailure;

  FailureConnectionFailure get asConnectionFailure =>
      this as FailureConnectionFailure;

  FailureDataParsingFailure get asDataParsingFailure =>
      this as FailureDataParsingFailure;

  FailureServerFailure? get asServerFailureOrNull {
    final failure = this;
    return failure is FailureServerFailure ? failure : null;
  }

  FailureConnectionFailure? get asConnectionFailureOrNull {
    final failure = this;
    return failure is FailureConnectionFailure ? failure : null;
  }

  FailureDataParsingFailure? get asDataParsingFailureOrNull {
    final failure = this;
    return failure is FailureDataParsingFailure ? failure : null;
  }

  R when<R extends Object?>({
    required R Function() serverFailure,
    required R Function() connectionFailure,
    required R Function() dataParsingFailure,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      return serverFailure();
    } else if (failure is FailureConnectionFailure) {
      return connectionFailure();
    } else if (failure is FailureDataParsingFailure) {
      return dataParsingFailure();
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function()? serverFailure,
    R Function()? connectionFailure,
    R Function()? dataParsingFailure,
    required R Function(Failure failure) orElse,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      return serverFailure != null ? serverFailure() : orElse(failure);
    } else if (failure is FailureConnectionFailure) {
      return connectionFailure != null ? connectionFailure() : orElse(failure);
    } else if (failure is FailureDataParsingFailure) {
      return dataParsingFailure != null
          ? dataParsingFailure()
          : orElse(failure);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function()? serverFailure,
    void Function()? connectionFailure,
    void Function()? dataParsingFailure,
    void Function(Failure failure)? orElse,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      if (serverFailure != null) {
        serverFailure();
      } else if (orElse != null) {
        orElse(failure);
      }
    } else if (failure is FailureConnectionFailure) {
      if (connectionFailure != null) {
        connectionFailure();
      } else if (orElse != null) {
        orElse(failure);
      }
    } else if (failure is FailureDataParsingFailure) {
      if (dataParsingFailure != null) {
        dataParsingFailure();
      } else if (orElse != null) {
        orElse(failure);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function()? serverFailure,
    R Function()? connectionFailure,
    R Function()? dataParsingFailure,
    R Function(Failure failure)? orElse,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      return serverFailure != null ? serverFailure() : orElse?.call(failure);
    } else if (failure is FailureConnectionFailure) {
      return connectionFailure != null
          ? connectionFailure()
          : orElse?.call(failure);
    } else if (failure is FailureDataParsingFailure) {
      return dataParsingFailure != null
          ? dataParsingFailure()
          : orElse?.call(failure);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(FailureServerFailure serverFailure) serverFailure,
    required R Function(FailureConnectionFailure connectionFailure)
        connectionFailure,
    required R Function(FailureDataParsingFailure dataParsingFailure)
        dataParsingFailure,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      return serverFailure(failure);
    } else if (failure is FailureConnectionFailure) {
      return connectionFailure(failure);
    } else if (failure is FailureDataParsingFailure) {
      return dataParsingFailure(failure);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(FailureServerFailure serverFailure)? serverFailure,
    R Function(FailureConnectionFailure connectionFailure)? connectionFailure,
    R Function(FailureDataParsingFailure dataParsingFailure)?
        dataParsingFailure,
    required R Function(Failure failure) orElse,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      return serverFailure != null ? serverFailure(failure) : orElse(failure);
    } else if (failure is FailureConnectionFailure) {
      return connectionFailure != null
          ? connectionFailure(failure)
          : orElse(failure);
    } else if (failure is FailureDataParsingFailure) {
      return dataParsingFailure != null
          ? dataParsingFailure(failure)
          : orElse(failure);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(FailureServerFailure serverFailure)? serverFailure,
    void Function(FailureConnectionFailure connectionFailure)?
        connectionFailure,
    void Function(FailureDataParsingFailure dataParsingFailure)?
        dataParsingFailure,
    void Function(Failure failure)? orElse,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      if (serverFailure != null) {
        serverFailure(failure);
      } else if (orElse != null) {
        orElse(failure);
      }
    } else if (failure is FailureConnectionFailure) {
      if (connectionFailure != null) {
        connectionFailure(failure);
      } else if (orElse != null) {
        orElse(failure);
      }
    } else if (failure is FailureDataParsingFailure) {
      if (dataParsingFailure != null) {
        dataParsingFailure(failure);
      } else if (orElse != null) {
        orElse(failure);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(FailureServerFailure serverFailure)? serverFailure,
    R Function(FailureConnectionFailure connectionFailure)? connectionFailure,
    R Function(FailureDataParsingFailure dataParsingFailure)?
        dataParsingFailure,
    R Function(Failure failure)? orElse,
  }) {
    final failure = this;
    if (failure is FailureServerFailure) {
      return serverFailure != null
          ? serverFailure(failure)
          : orElse?.call(failure);
    } else if (failure is FailureConnectionFailure) {
      return connectionFailure != null
          ? connectionFailure(failure)
          : orElse?.call(failure);
    } else if (failure is FailureDataParsingFailure) {
      return dataParsingFailure != null
          ? dataParsingFailure(failure)
          : orElse?.call(failure);
    } else {
      throw AssertionError();
    }
  }
}

/// (([FailureServerFailure] : [Failure]) serverFailure){}
///
/// with data equality
class FailureServerFailure extends Failure with EquatableMixin {
  const FailureServerFailure() : super._internal();

  @override
  String toString() => 'Failure.serverFailure()';

  @override
  List<Object?> get props => [];
}

/// (([FailureConnectionFailure] : [Failure]) connectionFailure){}
///
/// with data equality
class FailureConnectionFailure extends Failure with EquatableMixin {
  const FailureConnectionFailure() : super._internal();

  @override
  String toString() => 'Failure.connectionFailure()';

  @override
  List<Object?> get props => [];
}

/// (([FailureDataParsingFailure] : [Failure]) dataParsingFailure){}
///
/// with data equality
class FailureDataParsingFailure extends Failure with EquatableMixin {
  const FailureDataParsingFailure() : super._internal();

  @override
  String toString() => 'Failure.dataParsingFailure()';

  @override
  List<Object?> get props => [];
}
