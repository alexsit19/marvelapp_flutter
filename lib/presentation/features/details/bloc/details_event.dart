import 'package:equatable/equatable.dart';

class DetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCharacterDetail extends DetailsEvent {
  final String characterId;

  GetCharacterDetail({required this.characterId});
}
