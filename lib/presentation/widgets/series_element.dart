import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';

class SeriesElement extends StatelessWidget {
  final Series series;

  const SeriesElement({Key? key, required this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 120,
        height: 170,
        child: Column(
          children: [
            getSeriesImage(),
            Text(series.title ?? "title missing",
                maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget getSeriesImage() {
    return FadeInImage.assetNetwork(
        placeholder: "assets/graphics/placeholder-150x150.png",
        image: series.getThumbnailUrl("portrait_medium"),
        width: 120.0,
        height: 170.0,
        fit: BoxFit.fitWidth);
  }
}
