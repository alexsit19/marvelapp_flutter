import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain_module.dart';
import 'package:marvelapp_flutter/presentation/features/details//bloc/details_bloc.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';
import 'package:marvelapp_flutter/presentation/localization/utils/from_exception_to_string.dart';
import 'package:marvelapp_flutter/presentation/localization/utils/from_key_to_string.dart';
import 'package:marvelapp_flutter/presentation/widgets/details_content.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/widgets/page_error.dart';
import 'package:marvelapp_flutter/dependency_container.dart';
import 'bloc/details_state.dart';
import 'package:marvelapp_flutter/presentation/widgets/switch_locale_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("marvelAppDetail")),
        actions: const [
          SwitchLocaleButton(),
        ],
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
                errorText: context.translateException(state.error),
              );
            }
            return child;
          },
        ),
      ),
    );
  }
}
