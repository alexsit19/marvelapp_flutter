import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:marvelapp_flutter/presentation/screens/home_screen/bloc/home_screen_event.dart';
import 'package:marvelapp_flutter/presentation/screens/home_screen/bloc/home_screen_state.dart';
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
            switch (state.status) {
              case HomeScreenStatus.initial:
                break;
              case HomeScreenStatus.loading:
                break;
              case HomeScreenStatus.success:
                child = ListCharacters(list: state.characters);
                break;
              case HomeScreenStatus.error:
                child = const CustomErrorWidget();
                break;
            }
            return child;
          },
        ),
      )
    );
  }

  Widget getBody() {
    return FutureBuilder<List<Character>?>(
      future: repository.getCharacters(),
      builder: (context, snapshot) {
        Widget child = const Center(
          child: CircularProgressIndicator(),
        );
        if (snapshot.hasData) {
          child = ListCharacters(list: snapshot.data);
        } else if (snapshot.hasError) {
          child = const CustomErrorWidget();
        }
        return child;
      },
    );
  }
}
