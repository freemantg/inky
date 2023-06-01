import 'package:hive_flutter/hive_flutter.dart';

import 'tag_dto.dart';

class TagsLocalService {
  late final Box<TagDto> _tagDtosBox;

  TagsLocalService() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _tagDtosBox = await Hive.openBox<TagDto>('tagDtos');
  }

  Future<Stream<List<TagDto>>> streamTags({List<TagDto>? filter}) async {
    final tagDtos = _tagDtosBox;
    return tagDtos.watch().map((event) {
      if (filter != null) {
        return tagDtos.values.where((tag) => filter.contains(tag)).toList();
      } else {
        return tagDtos.values.toList();
      }
    });
  }

  Future<void> insert(TagDto tagDto) async {
    final tagDtos = _tagDtosBox;
    if (!tagDtos.containsKey(tagDto.id) && tagDto.name.isNotEmpty) {
      await tagDtos.put(tagDto.id, tagDto);
    }
  }

  Future<void> delete(TagDto tagDto) async {
    final tagDtos = _tagDtosBox;
    if (tagDtos.containsKey(tagDto.id)) {
      await tagDto.delete();
    }
  }

  Future<void> dispose() async {
    final tagDtos = _tagDtosBox;
    await tagDtos.close();
  }
}
