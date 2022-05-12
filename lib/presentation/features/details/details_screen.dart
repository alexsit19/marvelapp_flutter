import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/domain/repositories/marvell_repository.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_character_by_id_use_case.dart';
import 'package:marvelapp_flutter/domain/use_cases/get_series_by_id_use_case.dart';
import 'package:marvelapp_flutter/presentation/features/details//bloc/details_bloc.dart';
import 'package:marvelapp_flutter/presentation/widgets/details_content.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/presentation/widgets/custom_error_widget.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'bloc/details_state.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  final MarvellRepository repository = DioMarvellRepository();
  late GetCharacterByIdUseCase getCharacterByIdUseCase;
  late GetSeriesByIdUseCase getSeriesByIdUseCase;

  @override
  Widget build(BuildContext context) {
    getCharacterByIdUseCase = GetCharacterByIdUseCase(repository: repository);
    getSeriesByIdUseCase = GetSeriesByIdUseCase(repository: repository);
    final characterId = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarvellApp - Detail"),
      ),
      body: BlocProvider(
        create: (_) =>
            DetailsBloc(getCharacterByIdUseCase: getCharacterByIdUseCase, getSeriesByIdUseCase: getSeriesByIdUseCase)
              ..add(GetCharacterDetail(characterId: characterId)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (state.loading) return child;
            if (state.error == null && !state.loading) {
              child = SingleChildScrollView(
                child: DetailsContent(character: state.character as Character, series: state.series as List<Series>),
              );
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
