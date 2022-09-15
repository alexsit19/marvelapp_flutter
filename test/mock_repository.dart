import 'package:domain/domain_module.dart';
import 'package:marvelapp_flutter/presentation/models/character_view_data.dart';

const mockCharacters = <Character>[
  Character(id: 0, name: "0", thumbnailUrl: "url 0", description: "description 0"),
  Character(id: 1, name: "1", thumbnailUrl: "url 1", description: "description 1"),
  Character(id: 2, name: "2", thumbnailUrl: "url 2", description: "description 2"),
  Character(id: 3, name: "3", thumbnailUrl: "url 3", description: "description 3"),
  Character(id: 4, name: "4", thumbnailUrl: "url 4", description: "description 4"),
  Character(id: 5, name: "5", thumbnailUrl: "url 5", description: "description 5"),
  Character(id: 6, name: "6", thumbnailUrl: "url 6", description: "description 6"),
  Character(id: 7, name: "7", thumbnailUrl: "url 7", description: "description 7"),
  Character(id: 8, name: "8", thumbnailUrl: "url 8", description: "description 8"),
  Character(id: 9, name: "9", thumbnailUrl: "url 9", description: "description 9"),
  Character(id: 10, name: "10", thumbnailUrl: "url 10", description: "description 10"),
  Character(id: 11, name: "11", thumbnailUrl: "url 11", description: "description 11"),
  Character(id: 12, name: "12", thumbnailUrl: "url 12", description: "description 12"),
  Character(id: 13, name: "13", thumbnailUrl: "url 13", description: "description 13"),
  Character(id: 14, name: "14", thumbnailUrl: "url 14", description: "description 14"),
  Character(id: 15, name: "15", thumbnailUrl: "url 15", description: "description 15"),
  Character(id: 16, name: "16", thumbnailUrl: "url 16", description: "description 16"),
  Character(id: 17, name: "17", thumbnailUrl: "url 17", description: "description 17"),
  Character(id: 18, name: "18", thumbnailUrl: "url 18", description: "description 18"),
  Character(id: 19, name: "19", thumbnailUrl: "url 19", description: "description 19"),
  Character(id: 20, name: "20", thumbnailUrl: "url 20", description: "description 20"),
  Character(id: 21, name: "21", thumbnailUrl: "url 21", description: "description 21"),
  Character(id: 22, name: "22", thumbnailUrl: "url 22", description: "description 22"),
  Character(id: 23, name: "23", thumbnailUrl: "url 23", description: "description 23"),
  Character(id: 24, name: "24", thumbnailUrl: "url 24", description: "description 24"),
  Character(id: 25, name: "25", thumbnailUrl: "url 25", description: "description 25"),
  Character(id: 26, name: "26", thumbnailUrl: "url 26", description: "description 26"),
  Character(id: 27, name: "27", thumbnailUrl: "url 27", description: "description 27"),
  Character(id: 28, name: "28", thumbnailUrl: "url 28", description: "description 28"),
  Character(id: 29, name: "29", thumbnailUrl: "url 29", description: "description 29")
];

const mockCharactersViewData = <CharacterViewData>[
  CharacterViewData(id: 0, name: "0", thumbnailUrl: "url 0", description: "description 0"),
  CharacterViewData(id: 1, name: "1", thumbnailUrl: "url 1", description: "description 1"),
  CharacterViewData(id: 2, name: "2", thumbnailUrl: "url 2", description: "description 2"),
  CharacterViewData(id: 3, name: "3", thumbnailUrl: "url 3", description: "description 3"),
  CharacterViewData(id: 4, name: "4", thumbnailUrl: "url 4", description: "description 4"),
  CharacterViewData(id: 5, name: "5", thumbnailUrl: "url 5", description: "description 5"),
  CharacterViewData(id: 6, name: "6", thumbnailUrl: "url 6", description: "description 6"),
  CharacterViewData(id: 7, name: "7", thumbnailUrl: "url 7", description: "description 7"),
  CharacterViewData(id: 8, name: "8", thumbnailUrl: "url 8", description: "description 8"),
  CharacterViewData(id: 9, name: "9", thumbnailUrl: "url 9", description: "description 9"),
  CharacterViewData(id: 10, name: "10", thumbnailUrl: "url 10", description: "description 10"),
  CharacterViewData(id: 11, name: "11", thumbnailUrl: "url 11", description: "description 11"),
  CharacterViewData(id: 12, name: "12", thumbnailUrl: "url 12", description: "description 12"),
  CharacterViewData(id: 13, name: "13", thumbnailUrl: "url 13", description: "description 13"),
  CharacterViewData(id: 14, name: "14", thumbnailUrl: "url 14", description: "description 14"),
  CharacterViewData(id: 15, name: "15", thumbnailUrl: "url 15", description: "description 15"),
  CharacterViewData(id: 16, name: "16", thumbnailUrl: "url 16", description: "description 16"),
  CharacterViewData(id: 17, name: "17", thumbnailUrl: "url 17", description: "description 17"),
  CharacterViewData(id: 18, name: "18", thumbnailUrl: "url 18", description: "description 18"),
  CharacterViewData(id: 19, name: "19", thumbnailUrl: "url 19", description: "description 19"),
  CharacterViewData(id: 20, name: "20", thumbnailUrl: "url 20", description: "description 20"),
  CharacterViewData(id: 21, name: "21", thumbnailUrl: "url 21", description: "description 21"),
  CharacterViewData(id: 22, name: "22", thumbnailUrl: "url 22", description: "description 22"),
  CharacterViewData(id: 23, name: "23", thumbnailUrl: "url 23", description: "description 23"),
  CharacterViewData(id: 24, name: "24", thumbnailUrl: "url 24", description: "description 24"),
  CharacterViewData(id: 25, name: "25", thumbnailUrl: "url 25", description: "description 25"),
  CharacterViewData(id: 26, name: "26", thumbnailUrl: "url 26", description: "description 26"),
  CharacterViewData(id: 27, name: "27", thumbnailUrl: "url 27", description: "description 27"),
  CharacterViewData(id: 28, name: "28", thumbnailUrl: "url 28", description: "description 28"),
  CharacterViewData(id: 29, name: "29", thumbnailUrl: "url 29", description: "description 29"),
];

const mockSeries = <Series>[
  Series(id: 0, title: "title 0", thumbnailUrl: "url 0"),
  Series(id: 1, title: "title 1", thumbnailUrl: "url 1"),
  Series(id: 2, title: "title 2", thumbnailUrl: "url 2"),
  Series(id: 3, title: "title 3", thumbnailUrl: "url 3"),
  Series(id: 4, title: "title 4", thumbnailUrl: "url 4"),
  Series(id: 5, title: "title 5", thumbnailUrl: "url 5"),
  Series(id: 6, title: "title 6", thumbnailUrl: "url 6"),
  Series(id: 7, title: "title 7", thumbnailUrl: "url 7"),
  Series(id: 8, title: "title 8", thumbnailUrl: "url 8"),
  Series(id: 9, title: "title 9", thumbnailUrl: "url 9")
];

class MockRepository extends MarvellRepository {
  @override
  Future<Character> getCharacterDetail(String characterId) async {
    Character character = await Future.delayed(const Duration(seconds: 1), () => mockCharacters[0]);
    return character;
  }

  @override
  Future<List<Character>> getCharacters([int offset = 0]) async {
    int limit = 11;
    List<Character> characters = [];
    if (offset >= mockCharacters.length) {
      return characters;
    }
    if (offset + limit > mockCharacters.length - 1) {
      characters = mockCharacters.getRange(offset, mockCharacters.length).toList();
    }
    if (offset + limit < mockCharacters.length) {
      characters = mockCharacters.getRange(offset, offset + limit).toList();
    }

    return await Future.delayed(const Duration(seconds: 0), () => characters);
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    List<Series> series = await Future.delayed(const Duration(seconds: 1), () => [...mockSeries]);
    return series;
  }
}
