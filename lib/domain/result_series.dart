import 'package:sealed_annotations/sealed_annotations.dart';
import 'entities/series.dart';

part 'result_series.sealed.dart';

@Sealed()
abstract class _ResultSeries {
  void success(List<Series> series);

  void error(String error);
}