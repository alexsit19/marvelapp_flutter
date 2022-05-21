import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';

extension ToSeries on Series {
  SeriesViewData toSeriesViewData() {
    return SeriesViewData(
      title: title,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
