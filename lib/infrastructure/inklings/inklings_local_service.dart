import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../router.dart';
import '../tags/tag_dto.dart';
import 'inkling_dto.dart';

class InklingLocalServices {
  final Box<InklingDto> _inklingDtoBox;

  InklingLocalServices(this._inklingDtoBox);

  Stream<List<InklingDto>> streamInklings(
      {List<TagDto>? filter, InklingType? inklingType}) {
    final initialInklings = _inklingDtoBox.values.toList();

    return _inklingDtoBox.watch().map((event) {
      var inklings = _inklingDtoBox.values.toList();

      // Filter by Inkling Type
      if (inklingType != null) {
        inklings = inklings.where((inklingDto) {
          switch (inklingType) {
            case InklingType.note:
              return inklingDto.note.isNotEmpty;
            case InklingType.image:
              return inklingDto.imagePath.isNotEmpty;
            case InklingType.link:
              return inklingDto.link.isNotEmpty;
            default:
              return true;
          }
        }).toList();
      }

      // Filter by tags
      if (filter != null && filter.isNotEmpty) {
        inklings = inklings
            .where((dto) => dto.tags.any((tag) => filter.contains(tag)))
            .toList();
      }
      return inklings;
    }).startWith(initialInklings);
  }

  Future<void> upsert(InklingDto dto) async {
    await _inklingDtoBox.put(dto.hiveId, dto);
  }

  Future<void> delete(InklingDto dto) async {
    await _inklingDtoBox.delete(dto.hiveId);
  }
}
