import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/data/model/response_models/series.dart';

class SeriesElement extends StatelessWidget {
  final Series? series;

  const SeriesElement({Key? key, this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 120,
        height: 170,
        child: Column(
          children: [
            FadeInImage.assetNetwork(
                placeholder: "assets/graphics/placeholder-150x150.png",
                image:
                    "${series?.thumbnailPath}/portrait_medium.${series?.thumbnailExtension}",
                width: 120.0,
                height: 170.0,
                fit: BoxFit.fitWidth
              ),
            Text(series?.title ?? "title missing"),
          ],
        ),


      ),
    );
  }
}
