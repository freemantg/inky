import 'package:hive_flutter/hive_flutter.dart';

import 'tag_dto.dart';

class TagsLocalService {
  final Box<TagDto> _tagDtosBox;

  TagsLocalService(this._tagDtosBox);

  Future<Stream<List<TagDto>>> streamTags({List<TagDto>? filter}) async {
    return _tagDtosBox.watch().map((event) {
      if (filter != null) {
        return _tagDtosBox.values.where((tag) => filter.contains(tag)).toList();
      } else {
        return _tagDtosBox.values.toList();
      }
    });
  }

  Future<void> insert(TagDto tagDto) async {
    if (!_tagDtosBox.containsKey(tagDto.id) && tagDto.name.isNotEmpty) {
      await _tagDtosBox.put(tagDto.id, tagDto);
    }
  }

  Future<void> delete(TagDto tagDto) async {
    if (_tagDtosBox.containsKey(tagDto.id)) {
      await tagDto.delete();
    }
  }
}
