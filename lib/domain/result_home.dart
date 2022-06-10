import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:sealed_annotations/sealed_annotations.dart';

part 'result_home.sealed.dart';

@Sealed()
abstract class _ResultHome {
  void success(List<Character> characters);

  void error(String error);
}