import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/data/model/response_models/character.dart';
import 'package:marvelapp_flutter/data/repository/dio_marvell_repository.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository.dart';
import 'package:marvelapp_flutter/widgets/custom_error_widget.dart';
import 'package:marvelapp_flutter/widgets/list_characters.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final MarvellRepository repository = DioMarvellRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarvellApp"),
      ),
      body: FutureBuilder<List<Character>?>(
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
      ),
    );
  }
}
