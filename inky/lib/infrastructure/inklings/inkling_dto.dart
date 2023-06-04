import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inky/domain/inklings/inkling.dart';

import '../tags/tag_dto.dart';

part 'inkling_dto.freezed.dart';
part 'inkling_dto.g.dart';

@freezed
class InklingDto with _$InklingDto {
  const InklingDto._();
  @HiveType(typeId: 1)
  @JsonSerializable(explicitToJson: true)
  const factory InklingDto({
    @HiveField(0) required String hiveId,
    @HiveField(1) required String note,
    @HiveField(2) required String link,
    @HiveField(3) required String imagePath,
    @HiveField(4) required List<TagDto> tags,
    @HiveField(5) required String memo,
  }) = _InklingDto;

  factory InklingDto.fromDomain(Inkling inkling) {
    return InklingDto(
      hiveId: inkling.hiveId,
      note: inkling.note,
      link: inkling.link,
      imagePath: inkling.imagePath,
      tags: inkling.tags.map((e) => TagDto.fromDomain(e)).toList(),
      memo: inkling.memo,
    );
  }

  Inkling toDomain() {
    return Inkling(
      hiveId: hiveId,
      note: note,
      link: link,
      imagePath: imagePath,
      memo: memo,
      tags: tags.map((e) => e.toDomain()).toList(),
    );
  }
}
