import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/local/dao/character_dao.dart';
import 'package:marvelapp_flutter/data/local/database/database.dart';
import 'package:marvelapp_flutter/data/local/source/local_data_source.dart';
import 'package:marvelapp_flutter/data/remote/source/remote_data_source.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_characters_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
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
        create: (_) => HomeBloc(
          getCharactersUseCase: GetCharactersUseCase(
            repository: DioMarvellRepository(
              remoteDataSource: RemoteDataSource(),
              localDataSource: LocalDataSource(
                characterDao: CharacterDao(Database()),
              ),
            ),
          ),
        )..add(ReadyForData()),
        child: const ListCharacters(),
      ),
    );
  }
}
