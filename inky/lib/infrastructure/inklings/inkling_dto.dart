import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inky/domain/inklings/inkling.dart';

import '../tags/tag_dto.dart';

part 'inkling_dto.freezed.dart';
part 'inkling_dto.g.dart';

@freezed
@HiveType(typeId: 1)
class InklingDto extends HiveObject with _$InklingDto {
  InklingDto._();

  @JsonSerializable(explicitToJson: true)
  factory InklingDto({
    @HiveField(0) required String note,
    @HiveField(1) required String link,
    @HiveField(2) required List<TagDto> tags,
    @HiveField(3) required String memo,
  }) = _InklingDto;

  factory InklingDto.fromDomain(Inkling inkling) => InklingDto(
        note: inkling.note,
        link: inkling.link,
        tags: inkling.tags.map((e) => TagDto.fromDomain(e)).toList(),
        memo: inkling.memo,
      );
}

extension InklingDtoX on InklingDto {
  Inkling toDomain() => Inkling(
        note: note,
        link: link,
        memo: memo,
        tags: tags.map((e) => e.toDomain()).toList(),
      );
}
