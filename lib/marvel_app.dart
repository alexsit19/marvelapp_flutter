import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/Localization/app_localization_setup.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_event.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_state.dart';
import 'package:marvelapp_flutter/presentation/navigation/route_generator.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocalizationBloc()..add(SetLocalRu()),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localeState) {
          return MaterialApp(
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocals,
            localizationsDelegates: AppLocalizationsSetup.localizationDelegates,
            localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallBack,
            locale: localeState.locale,
          );
        },
      ),
    );
  }
}
