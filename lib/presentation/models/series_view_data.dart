import 'package:equatable/equatable.dart';

class SeriesViewData extends Equatable {
  final String? title;
  final String? thumbnailUrl;

  const SeriesViewData({
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  List<Object?> get props => [title, thumbnailUrl];


}
