// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inkling_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InklingDtoAdapter extends TypeAdapter<_$_InklingDto> {
  @override
  final int typeId = 1;

  @override
  _$_InklingDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_InklingDto(
      hiveId: fields[0] as String,
      note: fields[1] as String,
      link: fields[2] as String,
      imagePath: fields[3] as String,
      tags: (fields[4] as List).cast<TagDto>(),
      memo: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_InklingDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.hiveId)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(5)
      ..write(obj.memo)
      ..writeByte(4)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InklingDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InklingDto _$$_InklingDtoFromJson(Map<String, dynamic> json) =>
    _$_InklingDto(
      hiveId: json['hiveId'] as String,
      note: json['note'] as String,
      link: json['link'] as String,
      imagePath: json['imagePath'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      memo: json['memo'] as String,
    );

Map<String, dynamic> _$$_InklingDtoToJson(_$_InklingDto instance) =>
    <String, dynamic>{
      'hiveId': instance.hiveId,
      'note': instance.note,
      'link': instance.link,
      'imagePath': instance.imagePath,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'memo': instance.memo,
    };
