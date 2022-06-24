import 'package:equatable/equatable.dart';

enum CurrentLocale { ru, en }

class LocalizationState extends Equatable{
  final CurrentLocale locale;

  const LocalizationState({required this.locale});

  LocalizationState copyWith({required CurrentLocale locale}) {
    return LocalizationState(locale: locale);
  }

  @override
  List<Object?> get props => [locale];
}
