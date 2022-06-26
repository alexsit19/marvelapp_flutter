import 'package:equatable/equatable.dart';

class ErrorObject {
  ErrorObject._();

  factory ErrorObject.noInternetConnection() = NoInternetConnection;

  factory ErrorObject.slowInternetConnection() = SlowInternetConnection;

  factory ErrorObject.unknownError() = UnknownError;
}

class NoInternetConnection extends ErrorObject {
  NoInternetConnection() : super._();
}

class SlowInternetConnection extends ErrorObject {
  SlowInternetConnection() : super._();
}

class UnknownError extends ErrorObject {
  UnknownError() : super._();
}
