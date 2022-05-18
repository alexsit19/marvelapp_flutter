import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:marvelapp_flutter/presentation/models/series_view_data.dart';

class SeriesMapper {
  static SeriesViewData toSeriesViewData(Series series) {
    return SeriesViewData(title: series.title,
        thumbnailUrl: series.thumbnailUrl,
        description: series.description);
  }
}