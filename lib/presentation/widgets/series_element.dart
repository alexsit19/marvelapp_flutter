import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';

class SeriesElement extends StatelessWidget {
  final SeriesViewData series;

  const SeriesElement({Key? key, required this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = series.title ?? "";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 120,
        height: 170,
        child: Column(
          children: [
            _getSeriesImage(series),
            Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget _getSeriesImage(SeriesViewData series) {
    Widget seriesImage = SizedBox(
        child: Image.asset("assets/graphics/placeholder-150x150.png"),
        width: 120.0,
        height: 170.0);
    String? thumbnailUrl = series.thumbnailUrl;
    if (thumbnailUrl != null) {
      seriesImage = FadeInImage.assetNetwork(
        placeholder: "assets/graphics/placeholder-150x150.png",
        image: thumbnailUrl,
        width: 120.0,
        height: 170.0,
        fit: BoxFit.fitWidth,
      );
    }
    return seriesImage;
  }
}
