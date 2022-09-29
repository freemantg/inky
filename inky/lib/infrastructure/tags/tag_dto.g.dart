// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagDtoAdapter extends TypeAdapter<TagDto> {
  @override
  final int typeId = 0;

  @override
  TagDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagDto(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TagDto obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagDto _$$_TagDtoFromJson(Map<String, dynamic> json) => _$_TagDto(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_TagDtoToJson(_$_TagDto instance) => <String, dynamic>{
      'name': instance.name,
    };
