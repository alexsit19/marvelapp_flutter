import 'package:sealed_annotations/sealed_annotations.dart';
import 'entities/character.dart';

part 'result_details.sealed.dart';

@Sealed()
abstract class _ResultDetails {
  void success(Character character);

  void error(String error);
}