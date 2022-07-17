import 'package:domain/domain_module.dart';
import 'package:data/src/data_sources/local/database/database.dart';

extension FromCharacterToTableData on Character {
  CharacterTableData fromCharacterToTableData() {
    return CharacterTableData(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
