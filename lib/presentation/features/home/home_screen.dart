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
        create: (_) =>
            HomeBloc(getCharactersUseCase: GetCharactersUseCase(repository: DioMarvellRepository()))..add(GetHeroes()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (state.characters != null && state.error == null) {
              child = ListCharacters(list: state.characters, error: state.error, hasReachedMax: state.hasReachedMax);
            } else if (state.characters == null && state.error == null) {
              return child;
            } else if (state.characters == null && state.error != null) {
              child =  const PageError(screen: "homeScreen");
            } else {
              child = ListCharacters(list: state.characters, error: state.error, hasReachedMax: state.hasReachedMax);
            }
            return child;
          },
        ),
      ),
    );
  }
}
