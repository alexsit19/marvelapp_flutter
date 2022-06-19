import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/widgets/center_loader.dart';
import 'package:marvelapp_flutter/presentation/widgets/list_characters.dart';
import 'package:marvelapp_flutter/presentation/widgets/page_error.dart';
import 'package:marvelapp_flutter/dependency_container.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarvellApp"),
      ),
      body: BlocProvider(
        create: (_) => HomeBloc(
          getCharactersUseCase: getIt.get<GetCharactersUseCase>())..add(ReadyForData()),
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
              );
            }
            if (state.characters.isNotEmpty) {
              bool loading = state.loading == Loading.inBottomRow ? true : false;
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
