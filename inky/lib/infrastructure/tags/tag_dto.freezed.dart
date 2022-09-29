// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagDto _$TagDtoFromJson(Map<String, dynamic> json) {
  return _TagDto.fromJson(json);
}

/// @nodoc
mixin _$TagDto {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagDtoCopyWith<TagDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagDtoCopyWith<$Res> {
  factory $TagDtoCopyWith(TagDto value, $Res Function(TagDto) then) =
      _$TagDtoCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String name});
}

/// @nodoc
class _$TagDtoCopyWithImpl<$Res> implements $TagDtoCopyWith<$Res> {
  _$TagDtoCopyWithImpl(this._value, this._then);

  final TagDto _value;
  // ignore: unused_field
  final $Res Function(TagDto) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TagDtoCopyWith<$Res> implements $TagDtoCopyWith<$Res> {
  factory _$$_TagDtoCopyWith(_$_TagDto value, $Res Function(_$_TagDto) then) =
      __$$_TagDtoCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String name});
}

/// @nodoc
class __$$_TagDtoCopyWithImpl<$Res> extends _$TagDtoCopyWithImpl<$Res>
    implements _$$_TagDtoCopyWith<$Res> {
  __$$_TagDtoCopyWithImpl(_$_TagDto _value, $Res Function(_$_TagDto) _then)
      : super(_value, (v) => _then(v as _$_TagDto));

  @override
  _$_TagDto get _value => super._value as _$_TagDto;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_TagDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TagDto extends _TagDto {
  _$_TagDto({@HiveField(0) required this.name}) : super._();

  factory _$_TagDto.fromJson(Map<String, dynamic> json) =>
      _$$_TagDtoFromJson(json);

  @override
  @HiveField(0)
  final String name;

  @override
  String toString() {
    return 'TagDto(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagDto &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_TagDtoCopyWith<_$_TagDto> get copyWith =>
      __$$_TagDtoCopyWithImpl<_$_TagDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagDtoToJson(
      this,
    );
  }
}

abstract class _TagDto extends TagDto {
  factory _TagDto({@HiveField(0) required final String name}) = _$_TagDto;
  _TagDto._() : super._();

  factory _TagDto.fromJson(Map<String, dynamic> json) = _$_TagDto.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TagDtoCopyWith<_$_TagDto> get copyWith =>
      throw _privateConstructorUsedError;
}
