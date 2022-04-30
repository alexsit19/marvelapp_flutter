import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_screen_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_screen_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_screen_state.dart';
import 'package:marvelapp_flutter/presentation/widgets/custom_error_widget.dart';
import 'package:marvelapp_flutter/presentation/widgets/list_characters.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final MarvellRepository repository = DioMarvellRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarvellApp"),
      ),
      body: BlocProvider(
        create: (_) => HomeScreenBloc(repository: repository)..add(GetHeroes()),
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (!state.loading) {
              if (state.error == null) {
                child = ListCharacters(list: state.characters);
              } else {
                child = const CustomErrorWidget();
              }
            }

            return child;
          },
        ),
      ),
    );
  }
}
