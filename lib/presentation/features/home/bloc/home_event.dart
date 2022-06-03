import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReadyForData extends HomeEvent {}

class ScrolledToEnd extends HomeEvent {}
