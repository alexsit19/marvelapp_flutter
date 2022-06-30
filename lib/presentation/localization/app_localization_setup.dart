import 'package:flutter/widgets.dart';
import 'package:marvelapp_flutter/presentation/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizationsSetup {
  static const Iterable<Locale> supportedLocals = [
    Locale('en'),
    Locale('ru'),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Locale? localeResolutionCallBack(Locale? locale, Iterable<Locale>? supportedLocals) {
    for (Locale supportedLocale in supportedLocals!) {
      if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocals.first;
  }
}