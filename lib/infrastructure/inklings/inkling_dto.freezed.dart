// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String get hiveId => throw _privateConstructorUsedError;
  @HiveField(1)
  String get note => throw _privateConstructorUsedError;
  @HiveField(2)
  String get link => throw _privateConstructorUsedError;
  @HiveField(3)
  String get imagePath => throw _privateConstructorUsedError;
  @HiveField(4)
  List<TagDto> get tags => throw _privateConstructorUsedError;
  @HiveField(5)
  String get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InklingDtoCopyWith<InklingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InklingDtoCopyWith<$Res> {
  factory $InklingDtoCopyWith(
          InklingDto value, $Res Function(InklingDto) then) =
      _$InklingDtoCopyWithImpl<$Res, InklingDto>;
  @useResult
  $Res call(
      {@HiveField(0) String hiveId,
      @HiveField(1) String note,
      @HiveField(2) String link,
      @HiveField(3) String imagePath,
      @HiveField(4) List<TagDto> tags,
      @HiveField(5) String memo});
}

/// @nodoc
class _$InklingDtoCopyWithImpl<$Res, $Val extends InklingDto>
    implements $InklingDtoCopyWith<$Res> {
  _$InklingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiveId = null,
    Object? note = null,
    Object? link = null,
    Object? imagePath = null,
    Object? tags = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      hiveId: null == hiveId
          ? _value.hiveId
          : hiveId // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagDto>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InklingDtoCopyWith<$Res>
    implements $InklingDtoCopyWith<$Res> {
  factory _$$_InklingDtoCopyWith(
          _$_InklingDto value, $Res Function(_$_InklingDto) then) =
      __$$_InklingDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String hiveId,
      @HiveField(1) String note,
      @HiveField(2) String link,
      @HiveField(3) String imagePath,
      @HiveField(4) List<TagDto> tags,
      @HiveField(5) String memo});
}

/// @nodoc
class __$$_InklingDtoCopyWithImpl<$Res>
    extends _$InklingDtoCopyWithImpl<$Res, _$_InklingDto>
    implements _$$_InklingDtoCopyWith<$Res> {
  __$$_InklingDtoCopyWithImpl(
      _$_InklingDto _value, $Res Function(_$_InklingDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiveId = null,
    Object? note = null,
    Object? link = null,
    Object? imagePath = null,
    Object? tags = null,
    Object? memo = null,
  }) {
    return _then(_$_InklingDto(
      hiveId: null == hiveId
          ? _value.hiveId
          : hiveId // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagDto>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class _$_InklingDto extends _InklingDto {
  const _$_InklingDto(
      {@HiveField(0) required this.hiveId,
      @HiveField(1) required this.note,
      @HiveField(2) required this.link,
      @HiveField(3) required this.imagePath,
      @HiveField(4) required final List<TagDto> tags,
      @HiveField(5) required this.memo})
      : _tags = tags,
        super._();

  @override
  @HiveField(0)
  final String hiveId;
  @override
  @HiveField(1)
  final String note;
  @override
  @HiveField(2)
  final String link;
  @override
  @HiveField(3)
  final String imagePath;
  final List<TagDto> _tags;
  @override
  @HiveField(4)
  List<TagDto> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @HiveField(5)
  final String memo;

  @override
  String toString() {
    return 'InklingDto(hiveId: $hiveId, note: $note, link: $link, imagePath: $imagePath, tags: $tags, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InklingDto &&
            (identical(other.hiveId, hiveId) || other.hiveId == hiveId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hiveId, note, link, imagePath,
      const DeepCollectionEquality().hash(_tags), memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InklingDtoCopyWith<_$_InklingDto> get copyWith =>
      __$$_InklingDtoCopyWithImpl<_$_InklingDto>(this, _$identity);
}

abstract class _InklingDto extends InklingDto {
  const factory _InklingDto(
      {@HiveField(0) required final String hiveId,
      @HiveField(1) required final String note,
      @HiveField(2) required final String link,
      @HiveField(3) required final String imagePath,
      @HiveField(4) required final List<TagDto> tags,
      @HiveField(5) required final String memo}) = _$_InklingDto;
  const _InklingDto._() : super._();

  @override
  @HiveField(0)
  String get hiveId;
  @override
  @HiveField(1)
  String get note;
  @override
  @HiveField(2)
  String get link;
  @override
  @HiveField(3)
  String get imagePath;
  @override
  @HiveField(4)
  List<TagDto> get tags;
  @override
  @HiveField(5)
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_InklingDtoCopyWith<_$_InklingDto> get copyWith =>
      throw _privateConstructorUsedError;
}
