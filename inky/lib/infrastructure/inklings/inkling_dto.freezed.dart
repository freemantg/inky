// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inkling_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InklingDto {
  @HiveField(0)
  String get note => throw _privateConstructorUsedError;
  @HiveField(1)
  String get link => throw _privateConstructorUsedError;
  @HiveField(2)
  String get imagePath => throw _privateConstructorUsedError;
  @HiveField(3)
  List<TagDto> get tags => throw _privateConstructorUsedError;
  @HiveField(4)
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InklingDtoCopyWith<InklingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InklingDtoCopyWith<$Res> {
  factory $InklingDtoCopyWith(
          InklingDto value, $Res Function(InklingDto) then) =
      _$InklingDtoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String note,
      @HiveField(1) String link,
      @HiveField(2) String imagePath,
      @HiveField(3) List<TagDto> tags,
      @HiveField(4) String memo});
}

/// @nodoc
class _$InklingDtoCopyWithImpl<$Res> implements $InklingDtoCopyWith<$Res> {
  _$InklingDtoCopyWithImpl(this._value, this._then);

  final InklingDto _value;
  // ignore: unused_field
  final $Res Function(InklingDto) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? link = freezed,
    Object? imagePath = freezed,
    Object? tags = freezed,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagDto>,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InklingDtoCopyWith<$Res>
    implements $InklingDtoCopyWith<$Res> {
  factory _$$_InklingDtoCopyWith(
          _$_InklingDto value, $Res Function(_$_InklingDto) then) =
      __$$_InklingDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String note,
      @HiveField(1) String link,
      @HiveField(2) String imagePath,
      @HiveField(3) List<TagDto> tags,
      @HiveField(4) String memo});
}

/// @nodoc
class __$$_InklingDtoCopyWithImpl<$Res> extends _$InklingDtoCopyWithImpl<$Res>
    implements _$$_InklingDtoCopyWith<$Res> {
  __$$_InklingDtoCopyWithImpl(
      _$_InklingDto _value, $Res Function(_$_InklingDto) _then)
      : super(_value, (v) => _then(v as _$_InklingDto));

  @override
  _$_InklingDto get _value => super._value as _$_InklingDto;

  @override
  $Res call({
    Object? note = freezed,
    Object? link = freezed,
    Object? imagePath = freezed,
    Object? tags = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$_InklingDto(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagDto>,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_InklingDto extends _InklingDto {
  _$_InklingDto(
      {@HiveField(0) required this.note,
      @HiveField(1) required this.link,
      @HiveField(2) required this.imagePath,
      @HiveField(3) required final List<TagDto> tags,
      @HiveField(4) required this.memo})
      : _tags = tags,
        super._();

  @override
  @HiveField(0)
  final String note;
  @override
  @HiveField(1)
  final String link;
  @override
  @HiveField(2)
  final String imagePath;
  final List<TagDto> _tags;
  @override
  @HiveField(3)
  List<TagDto> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @HiveField(4)
  final String memo;

  @override
  String toString() {
    return 'InklingDto(note: $note, link: $link, imagePath: $imagePath, tags: $tags, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InklingDto &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other.memo, memo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(memo));

  @JsonKey(ignore: true)
  @override
  _$$_InklingDtoCopyWith<_$_InklingDto> get copyWith =>
      __$$_InklingDtoCopyWithImpl<_$_InklingDto>(this, _$identity);
}

abstract class _InklingDto extends InklingDto {
  factory _InklingDto(
      {@HiveField(0) required final String note,
      @HiveField(1) required final String link,
      @HiveField(2) required final String imagePath,
      @HiveField(3) required final List<TagDto> tags,
      @HiveField(4) required final String memo}) = _$_InklingDto;
  _InklingDto._() : super._();

  @override
  @HiveField(0)
  String get note;
  @override
  @HiveField(1)
  String get link;
  @override
  @HiveField(2)
  String get imagePath;
  @override
  @HiveField(3)
  List<TagDto> get tags;
  @override
  @HiveField(4)
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_InklingDtoCopyWith<_$_InklingDto> get copyWith =>
      throw _privateConstructorUsedError;
}
