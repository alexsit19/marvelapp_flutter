import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain_module.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/localization/utils/from_exception_to_string.dart';
import 'package:marvelapp_flutter/presentation/localization/utils/from_key_to_string.dart';
import 'package:marvelapp_flutter/presentation/widgets/center_loader.dart';
import 'package:marvelapp_flutter/presentation/widgets/list_characters.dart';
import 'package:marvelapp_flutter/presentation/widgets/page_error.dart';
import 'package:marvelapp_flutter/dependency_container.dart';
import 'package:marvelapp_flutter/presentation/widgets/switch_locale_button.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate("marvellApp")),
        actions: const [
          SwitchLocaleButton(),
        ],
      ),
      body: BlocProvider(
        create: (_) => HomeBloc(getCharactersUseCase: getIt.get<GetCharactersUseCase>())..add(ReadyForData()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Widget child = const CircularProgressIndicator();
            if (state.loading == Loading.fullScreen) {
              child = const CenterLoader();
            }
            if (state.error != null) {
              child = PageError(
                onRetry: () {
                  context.read<HomeBloc>().add(ReadyForData());
                },
                errorText: context.translateException(state.error),
              );
            }
            if (state.characters.isNotEmpty) {
              bool loading = state.loading == Loading.nextPage ? true : false;
              child = ListCharacters(
                characters: state.characters,
                hasReachedMax: state.hasReachedMax,
                loading: loading,
                error: state.error,
              );
            }
            return child;
          },
        ),
      ),
    );
  }
}
