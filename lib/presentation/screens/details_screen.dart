import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/presentation/widgets/details_content.dart';
import '../../data/model/response_models/character.dart';
import '../../data/model/response_models/series.dart';
import '../widgets/custom_error_widget.dart';

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
      body: FutureBuilder<Character?>(
        future: repository.getCharacterDetail(characterId),
        builder: (context, snapshot) {
          Widget child = const Center(
            child: CircularProgressIndicator(),
          );
          if (snapshot.hasData) {
            var character = snapshot.data;
            return FutureBuilder<List<Series>?>(
                future: repository.getSerieses(characterId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: DetailsContent(
                          character: character, series: snapshot.data),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                });
          } else if (snapshot.hasError) {
            child = const CustomErrorWidget();
          }
          return child;
        },
      ),
    );
  }
}
