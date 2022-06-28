import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/Localization/app_localizations.dart';

extension FromKeyToString on BuildContext {
  String translate(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}
