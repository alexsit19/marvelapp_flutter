import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marvelapp_flutter/presentation/widgets/series_block.dart';
import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'description_block.dart';

class DetailsContent extends StatelessWidget {
  final Character character;
  final List<Series> series;

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

  Widget _getName(Character character) {
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

  Widget _getHeroImage(Character character) {
    return FadeInImage.assetNetwork(
      placeholder: "assets/graphics/placeholder-150x150.png",
      image: character.getThumbnailUrl("standard_xlarge"),
      height: 300,
      width: 300,
      fit: BoxFit.fitHeight,
    );
  }
}
