class ErrorObject {
  ErrorObject._();

  factory ErrorObject.noInternetConnection(String message) = NoInternetConnection;

  factory ErrorObject.slowInternetConnection(String message) = SlowInternetConnection;

  factory ErrorObject.unknownError(String message) = UnknownError;
}

class NoInternetConnection extends ErrorObject {
  final String message;

  NoInternetConnection(this.message) : super._();
}

class SlowInternetConnection extends ErrorObject {
  final String message;

  SlowInternetConnection(this.message) : super._();
}

class UnknownError extends ErrorObject {
  final String message;

  UnknownError(this.message) : super._();
}