import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marvelapp_flutter/presentation/widgets/series_element.dart';
import '../../data/model/response_models/character.dart';
import '../../data/model/response_models/series.dart';

class DetailsContent extends StatelessWidget {
  final Character? character;
  final List<Series>? series;

  const DetailsContent(
      {Key? key, required this.character, required this.series})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (character == null) {
      return const Text(
        "Information not available",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: "assets/graphics/placeholder-150x150.png",
              image: _getThumbnailUrl(),
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
            _getDescriptionBlock(),
            _getSeriesBlock(),
          ],
        ),
      );
    }
  }

  String _getThumbnailUrl() {
    String? path = character?.thumbnailPath;
    String? extension = character?.thumbnailExtension;
    String format = "standard_xlarge";
    return "$path/$format.$extension";
  }

  Widget _getDescriptionBlock() {
    bool visible = false;
    print(character?.description);
    if (character?.description != null && character?.description != "") {
      visible = true;
    } else {
      visible = false;
    }
    print(visible);
    return Visibility(
      visible: visible,
      child: Column(
        children: [
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
              character?.description as String,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSeriesBlock() {
    bool visible = false;
    if (series != null) {
      if (series!.isNotEmpty) {
        visible = true;
      }
    } else {
      visible = false;
    }
    return Visibility(
      visible: visible,
      child: Column(
        children: [
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
