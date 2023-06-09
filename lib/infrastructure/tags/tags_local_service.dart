import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'tag_dto.dart';

class TagsLocalService {
  final Box<TagDto> _tagDtosBox;

  TagsLocalService(this._tagDtosBox);

  Stream<List<TagDto>> streamTags({List<TagDto>? filter}) {
    return _tagDtosBox.watch().map((event) {
      var values = _tagDtosBox.values.toList();
      if (filter != null && filter.isNotEmpty) {
        values = values.where((tag) => !filter.contains(tag)).toList();
      }
      return values;
    }).startWith(
      _tagDtosBox.values
          .where((tag) => filter == null || !filter.contains(tag))
          .toList(),
    );
  }

  Future<void> insert(TagDto tagDto) async {
    if (!_tagDtosBox.containsKey(tagDto.id) && tagDto.name.isNotEmpty) {
      await _tagDtosBox.put(tagDto.id, tagDto);
    }
  }

  Future<void> delete(TagDto tagDto) async {
    if (_tagDtosBox.containsKey(tagDto.id)) {
      await _tagDtosBox.delete(tagDto.id);
    }
  }
}
