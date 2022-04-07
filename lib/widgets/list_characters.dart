import 'package:flutter/material.dart';
import '../data/model/character.dart';
import '../navigation/app_routes.dart';

class ListCharacters extends StatelessWidget {
  final AsyncSnapshot<List<Character>?> list;

  const ListCharacters({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: list.data?.length,
        itemBuilder: (context, index) {
          final item = list.data?[index] as Character;
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.detailScreen,
                    arguments: item.id);
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                    child: Image.network(
                      "${item.thumbnailPath}/standard_medium.${item.thumbnailExtension}",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      item.name ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
