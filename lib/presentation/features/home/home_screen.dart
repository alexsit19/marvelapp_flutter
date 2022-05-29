import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/widgets/page_error.dart';
import 'package:marvelapp_flutter/presentation/widgets/list_characters.dart';
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
        create: (_) => HomeBloc(getCharactersUseCase: GetCharactersUseCase(repository: DioMarvellRepository()))
          ..add(ReadyForData()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (state.characters != null && state.error == null) {
              return ListCharacters(list: state.characters, error: state.error, hasReachedMax: state.hasReachedMax);
            }
            if (state.characters == null && state.error == null) {
              return child;
            }
            if (state.characters == null && state.error != null) {
              return PageError(
                onRetry: () {
                  context.read<HomeBloc>().add(ReadyForData());
                },
              );
            }
            return ListCharacters(list: state.characters, error: state.error, hasReachedMax: state.hasReachedMax);
          },
        ),
      ),
    );
  }
}
