import 'package:domain/domain_module.dart';

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
  Character(id: 9, name: "9", thumbnailUrl: "url 9", description: "description 9")
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
    List<Character> characters = await Future.delayed(const Duration(seconds: 1), () => [...mockCharacters]);
    return characters;
  }

  @override
  Future<List<Series>> getSeries(String characterId) async {
    List<Series> series = await Future.delayed(const Duration(seconds: 1), () => [...mockSeries]);
    return series;
  }
}
