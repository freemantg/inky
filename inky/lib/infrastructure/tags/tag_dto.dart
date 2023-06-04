import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/tags/tag.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
@HiveType(typeId: 0)
class TagDto extends HiveObject with _$TagDto {
  TagDto._();

  @JsonSerializable(explicitToJson: true)
  factory TagDto({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
  }) = _TagDto;

  factory TagDto.initial() => TagDto(name: '', id: '');

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  factory TagDto.fromDomain(Tag tag) => TagDto(name: tag.name, id: tag.id);

  Tag toDomain() {
    return Tag(
      id: id,
      name: name,
    );
  }
}
