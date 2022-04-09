import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marvelapp_flutter/widgets/series_element.dart';
import '../data/model/response_models/character.dart';
import '../data/model/response_models/series.dart';

class DetailsContent extends StatelessWidget {
  final Character? character;
  final List<Series>? series;

  const DetailsContent(
      {Key? key, required this.character, required this.series})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description = "";
    if (character?.description != null) {
      description = character?.description as String;
    }
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: "assets/graphics/placeholder-150x150.png",
            image:
                "${character?.thumbnailPath}/standard_xlarge.${character?.thumbnailExtension}",
            height: 300,
            width: 300,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  character?.name ?? "missing name",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 4.0),
            child: Row(
              children: const [
                Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
            child: Text(
              description != "" ? description : "description missing",
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              children: const [
                Text(
                  "Series",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: series?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final item = series?[index];
                  return SeriesElement(series: item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
