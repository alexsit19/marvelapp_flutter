import 'package:sealed_annotations/sealed_annotations.dart';
import 'entities/character.dart';

part 'result_details.sealed.dart';

@Sealed()
abstract class _ResultDetails {
  Character? get character;
  String? get errorString;

  void success(Character character);

  void error(String? errorString);
}
