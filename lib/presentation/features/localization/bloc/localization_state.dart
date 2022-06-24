import 'package:equatable/equatable.dart';

enum Locale { ru, en }

class LocalizationState extends Equatable{
  final Locale locale;

  const LocalizationState({required this.locale});

  LocalizationState copyWith({required Locale locale}) {
    return LocalizationState(locale: locale);
  }

  @override
  List<Object?> get props => [locale];
}
