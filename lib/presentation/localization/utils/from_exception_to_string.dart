import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/domain/error_handling/exceptions.dart';
import 'package:marvelapp_flutter/presentation/localization/app_localizations.dart';

extension FromExceptionToString on BuildContext {
  String translateException(Exception? exception) {
    if (exception is NoConnectionException) {
      return AppLocalizations.of(this).translate("noInternetConnection");
    } else if (exception is DataRetrieveException) {
      return AppLocalizations.of(this).translate("slowInternetConnection");
    } else {
      return AppLocalizations.of(this).translate("unknownError");
    }
  }
}
