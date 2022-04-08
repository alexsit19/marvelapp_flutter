import 'package:flutter/material.dart';
import '../data/model/response_models/character.dart';
import '../navigation/app_routes.dart';

class ListCharacters extends StatelessWidget {
  final List<Character>? list;

  const ListCharacters({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.builder(
        itemCount: list?.length,
        itemBuilder: (context, index) {
          final item = list?[index] as Character;
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
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/graphics/placeholder-150x150.png',
                      image:
                          "${item.thumbnailPath}/standard_medium.${item.thumbnailExtension}",
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.fill,
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
