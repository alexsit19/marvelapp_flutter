import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';
import 'package:marvelapp_flutter/presentation/widgets/series_block.dart';
import 'description_block.dart';

class DetailsContent extends StatelessWidget {
  final CharacterViewData character;
  final List<SeriesViewData> series;

  const DetailsContent(
      {Key? key, required this.character, required this.series})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          _getHeroImage(character),
          _getName(character),
          if (character.description != null && character.description != "")
            DescriptionBlock(character: character),
          if (series.isNotEmpty) SeriesBlock(series: series),
        ],
      ),
    );
  }

  Widget _getName(CharacterViewData character) {
    String name = character.name ?? "";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeroImage(CharacterViewData character) {
    return FadeInImage.assetNetwork(
      placeholder: "assets/graphics/placeholder-150x150.png",
      image: character.thumbnailUrl ?? "",
      height: 300,
      width: 300,
      fit: BoxFit.fitHeight,
      imageErrorBuilder: (_, __, ___) {
        return const SizedBox(
          child: Icon(
            Icons.broken_image,
            size: 250,
            color: Colors.grey,
          ),
          height: 300.0,
          width: 300.0,
        );
      },
    );
  }
}
