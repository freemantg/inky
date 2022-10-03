import 'package:hive_flutter/hive_flutter.dart';

import '../../router.dart';
import '../tags/tag_dto.dart';
import 'inkling_dto.dart';

class InklingLocalServices {
  late Box<InklingDto> _inklingDtos;

  Future<void> init() async => _inklingDtos = await Hive.openBox('inklingBox');

  List<InklingDto> fetchInklings({
    List<TagDto>? filter,
    InklingType? inklingType,
  }) {
    final inklings = _inklingDtos.values.toList();

    List<InklingDto> filteredList;

    if (inklingType != null) {
      filteredList = inklings.where(
        (inklingDto) {
          switch (inklingType) {
            case InklingType.note:
              return inklingDto.note.isNotEmpty;
            case InklingType.image:
              return inklingDto.imagePath.isNotEmpty;
            case InklingType.link:
              return inklingDto.link.isNotEmpty;
          }
        },
      ).toList();
    } else {
      filteredList = inklings;
    }

    //IF FILTER IS NOT NULL OR EMPTY
    if (filter?.isNotEmpty ?? false) {
      filteredList = filteredList
          .where((inklingDto) =>
              inklingDto.tags.any((tagDto) => filter!.contains(tagDto)))
          .toList();
    }
    return filteredList;
  }

  Future<void> insert(InklingDto dto) async {
    await _inklingDtos.add(dto);
  }

  Future<void> delete(InklingDto dto) async {
    final index = dto.hiveId;
    final dtoToDelete = _inklingDtos.get(index);
    if (dtoToDelete != null) {
      await dtoToDelete.delete();
    }
    return;
  }

  Future<void> update(InklingDto dto) async {
    final index = dto.hiveId;
    if (index != null) {
      await _inklingDtos.put(index, dto);
    }
    return;
  }
}
