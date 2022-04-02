import 'package:flutter/material.dart';
import '../data/model/character.dart';

class ListCharacters extends StatelessWidget {
  final AsyncSnapshot<List<Character>?> list;

  const ListCharacters({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: list.data?.length,
        itemBuilder: (context, index) {
          final item = list.data?[index] as Character;
          return Card(
            child: Row(
              children: [
                Image.network(
                    "${item.thumbnailPath}/standard_medium.${item.thumbnailExtension}"),
                Expanded(
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
