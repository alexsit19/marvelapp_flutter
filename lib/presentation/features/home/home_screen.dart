import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_state.dart';
import 'package:marvelapp_flutter/presentation/widgets/custom_error_widget.dart';
import 'package:marvelapp_flutter/presentation/widgets/list_characters.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  GetCharactersUseCase getCharactersUseCase = GetCharactersUseCase(repository: DioMarvellRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarvellApp"),
      ),
      body: BlocProvider(
        create: (_) => HomeBloc(getCharactersUseCase: getCharactersUseCase)..add(GetHeroes()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (state.loading) return child;
            if (state.error == null && !state.loading) {
              child = ListCharacters(list: state.characters);
            } else {
              child = const CustomErrorWidget();
            }
            return child;
          },
        ),
      ),
    );
  }
}
