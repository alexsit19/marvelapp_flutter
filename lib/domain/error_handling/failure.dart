import 'package:sealed_annotations/sealed_annotations.dart';

part 'failure.sealed.dart';

@Sealed()
abstract class _Failure {
  void serverFailure();
  void connectionFailure();
  void dataParsingFailure();
}