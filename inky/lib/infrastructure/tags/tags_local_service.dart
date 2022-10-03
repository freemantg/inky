import 'package:hive_flutter/hive_flutter.dart';

import 'tag_dto.dart';

class TagsLocalService {
  late Box<TagDto> _tagDtos;

  Future<void> init() async => _tagDtos = await Hive.openBox<TagDto>('tagDtos');

  List<TagDto> fetchTags({List<TagDto>? filter}) {
    if (filter != null) {
      return _tagDtos.values
          .where((tagDto) => !filter.contains(tagDto))
          .toList();
    }
    return _tagDtos.values.toList();
  }

  Stream<List<TagDto>> tagStream({List<TagDto>? filter}) {
    final stream = _tagDtos.watch().map((_) => _tagDtos.values.toList());

    return stream;
  }

  Future<void> insert(TagDto tagDto) async {
    if (_tagDtos.values.contains(tagDto)) {
      return;
    }
    _tagDtos.add(tagDto);
  }

  Future<void> delete(TagDto tagDto) async {
    final tagDtoToDelete =
        _tagDtos.values.firstWhere((element) => element == tagDto);
    await tagDtoToDelete.delete();
  }
}
