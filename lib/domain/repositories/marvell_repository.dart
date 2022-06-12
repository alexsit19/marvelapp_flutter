import 'package:marvelapp_flutter/domain/entities/character.dart';
import 'package:marvelapp_flutter/domain/entities/series.dart';
import 'package:dartz/dartz.dart';
import 'package:marvelapp_flutter/domain/error_handling/failure.dart';

abstract class MarvellRepository {
  Future<Either<Failure, List<Character>>> getCharacters([int offset, bool getFromLocal]);
  Future<Either<Failure, Character>> getCharacterDetail(String characterId);
  Future<Either<Failure, List<Series>>> getSeries(String characterId);
}
