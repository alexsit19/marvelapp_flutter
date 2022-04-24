import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/screens/details_screen/bloc/details_screen_bloc.dart';
import 'package:marvelapp_flutter/presentation/screens/details_screen/bloc/details_screen_state.dart';
import 'package:marvelapp_flutter/presentation/widgets/details_content.dart';
import '../../../data/model/response_models/character.dart';
import '../../../data/model/response_models/series.dart';
import '../../widgets/custom_error_widget.dart';
import 'bloc/details_screen_event.dart';

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
        create: (_) =>
            DetailsScreenBloc(repository: repository, characterId: characterId)
              ..add(GetCharacterDetail()),
        child: BlocBuilder<DetailsScreenBloc, DetailsScreenState>(
          builder: (context, state) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            switch (state.status) {
              case DetailsScreenStatus.initial:
                break;
              case DetailsScreenStatus.loading:
                break;
              case DetailsScreenStatus.success:
                child = SingleChildScrollView(
                  child: DetailsContent(
                      character: state.character, series: state.series),
                );
                break;
              case DetailsScreenStatus.error:
                child = const CustomErrorWidget();
                break;
            }
            return child;
          },
        ),
      ),
    );
  }
}
