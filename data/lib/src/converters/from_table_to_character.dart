import 'package:domain/domain_module.dart';
import 'package:data/src/data_sources/local/database/database.dart';

extension FromTableToCharacter on CharacterTableData {
  Character fromTableToCharacter() {
    return Character(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
      description: null,
    );
  }
}
