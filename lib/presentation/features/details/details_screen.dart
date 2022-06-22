import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_character_use_case.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_series_with_character_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/details//bloc/details_bloc.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';
import 'package:marvelapp_flutter/presentation/widgets/details_content.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/widgets/page_error.dart';
import 'package:marvelapp_flutter/dependency_container.dart';
import 'bloc/details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.marvellAppDetail),
      ),
      body: BlocProvider(
        create: (_) => DetailsBloc(
            getCharacterUseCase: getIt.get<GetCharacterUseCase>(),
            getSeriesUseCase: getIt.get<GetSeriesWithCharacterUseCase>())
          ..add(GetCharacterDetail(characterId: characterId)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (state.loading) return child;
            if (state.error == null && !state.loading) {
              child = SingleChildScrollView(
                child: DetailsContent(
                    character: state.character as CharacterViewData, series: state.series as List<SeriesViewData>),
              );
            } else {
              child = PageError(
                onRetry: () {
                  context.read<DetailsBloc>().add(GetCharacterDetail(characterId: characterId));
                },
                errorText: _errorStringToLocalizationString(state.error, context),
              );
            }
            return child;
          },
        ),
      ),
    );
  }

  String _errorStringToLocalizationString(String? error, BuildContext context) {
    switch(error) {
      case "slow internet connection" :
        return AppLocalizations.of(context)!.slowInternetConnection;
      case "no internet connection" :
        return AppLocalizations.of(context)!.noInternetConnection;
      default:
        return AppLocalizations.of(context)!.unknownError;
    }
  }
}
