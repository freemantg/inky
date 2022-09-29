import 'package:hive_flutter/hive_flutter.dart';

import 'tag_dto.dart';

class TagsLocalService {
  late Box<TagDto> _tagDtos;

  Future<void> init() async => _tagDtos = await Hive.openBox<TagDto>('tagDtos');

  Future<List<TagDto>> fetchTags() async => _tagDtos.values.toList();

  Future<void> insert(TagDto tagDto) async {
    await _tagDtos.add(tagDto);
  }

  Future<void> delete(TagDto tagDto) async {
    final tagDtoToDelete =
        _tagDtos.values.firstWhere((element) => element == tagDto);
    await tagDtoToDelete.delete();
  }
}
