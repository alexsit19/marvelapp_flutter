import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/data/repository/marvell_repository_impl.dart';
import '../data/model/character.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  final repository = MarvellRepositoryImpl();

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
            var character = snapshot.data;
            return Column(
              children: <Widget>[
                Image.network(
                    "${character?.thumbnailPath}/portrait_fantastic.${character?.thumbnailExtension}"),
                Text("${character?.name}"),
                Text("${character?.description}")
              ],
            );
          }),
    );
  }
}
