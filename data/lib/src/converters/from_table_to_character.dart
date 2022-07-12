import 'package:data/data_module.dart';
import 'package:domain/domain_module.dart';

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
