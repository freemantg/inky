import 'package:hive_flutter/hive_flutter.dart';

import '../../router.dart';
import '../tags/tag_dto.dart';
import 'inkling_dto.dart';

class InklingLocalServices {
  late final Box<InklingDto> _inklingDtoBox;

  InklingLocalServices() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _inklingDtoBox = await Hive.openBox<InklingDto>('inklings');
  }

  Stream<List<InklingDto>> streamInklings(
      {List<TagDto>? filter, InklingType? inklingType}) {
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
    });
  }

  Future<List<InklingDto>> fetchInklings({
    List<TagDto>? filter,
    InklingType? inklingType,
  }) async {
    var inklings = _inklingDtoBox.values.toList();

    if (inklingType != null) {
      inklings = inklings.where((inklingDto) {
        switch (inklingType) {
          case InklingType.note:
            return inklingDto.note.isNotEmpty;
          case InklingType.image:
            return inklingDto.imagePath.isNotEmpty;
          case InklingType.link:
            return inklingDto.link.isNotEmpty;
        }
      }).toList();
    }

    if (filter?.isNotEmpty ?? false) {
      inklings = inklings
          .where((inklingDto) =>
              inklingDto.tags.any((tagDto) => filter!.contains(tagDto)))
          .toList();
    }

    return inklings;
  }

  Future<void> insert(InklingDto dto) async {
    await _inklingDtoBox.add(dto);
  }

  Future<void> delete(InklingDto dto) async {
    if (dto.hiveId != null) {
      await _inklingDtoBox.delete(dto.hiveId);
    }
  }

  Future<void> update(InklingDto dto) async {
    if (dto.hiveId != null) {
      await _inklingDtoBox.put(dto.hiveId, dto);
    }
  }
}
