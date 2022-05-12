import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/presentation/widgets/series_element.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';

class SeriesBlock extends StatelessWidget {
  final List<Series> series;

  const SeriesBlock({Key? key, required this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              itemCount: series.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final item = series[index];
                return SeriesElement(series: item);
              },
            ),
          ),
        ),
      ],
    );
    ;
  }
}
