import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/features/details//bloc/details_bloc.dart';
import 'package:marvelapp_flutter/presentation/widgets/details_content.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';
import 'package:marvelapp_flutter/presentation/widgets/custom_error_widget.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'bloc/details_state.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  final MarvellRepository repository = DioMarvellRepository();

  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarvellApp - Detail"),
      ),
      body: BlocProvider(
        create: (_) => DetailsBloc(repository: repository)..add(GetCharacterDetail(characterId: characterId)),
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
