import 'package:data/data_module.dart';
import 'package:domain/domain_module.dart';

extension FromCharacterToTableData on Character {
  CharacterTableData fromCharacterToTableData() {
    return CharacterTableData(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
