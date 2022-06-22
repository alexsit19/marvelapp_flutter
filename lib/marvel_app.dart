import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/presentation/navigation/route_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
