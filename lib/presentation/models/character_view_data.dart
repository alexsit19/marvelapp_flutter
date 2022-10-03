import 'package:equatable/equatable.dart';

class CharacterViewData extends Equatable {
  final int? id;
  final String? name;
  final String? thumbnailUrl;
  final String? description;

  const CharacterViewData({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, thumbnailUrl, description];
}
