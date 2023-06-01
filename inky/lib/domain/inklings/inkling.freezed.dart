// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inkling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Inkling {
  int? get hiveId => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  MetaData? get metaData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InklingCopyWith<Inkling> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InklingCopyWith<$Res> {
  factory $InklingCopyWith(Inkling value, $Res Function(Inkling) then) =
      _$InklingCopyWithImpl<$Res, Inkling>;
  @useResult
  $Res call(
      {int? hiveId,
      String note,
      String link,
      String imagePath,
      String memo,
      List<Tag> tags,
      MetaData? metaData});
}

/// @nodoc
class _$InklingCopyWithImpl<$Res, $Val extends Inkling>
    implements $InklingCopyWith<$Res> {
  _$InklingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiveId = freezed,
    Object? note = null,
    Object? link = null,
    Object? imagePath = null,
    Object? memo = null,
    Object? tags = null,
    Object? metaData = freezed,
  }) {
    return _then(_value.copyWith(
      hiveId: freezed == hiveId
          ? _value.hiveId
          : hiveId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InklingCopyWith<$Res> implements $InklingCopyWith<$Res> {
  factory _$$_InklingCopyWith(
          _$_Inkling value, $Res Function(_$_Inkling) then) =
      __$$_InklingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? hiveId,
      String note,
      String link,
      String imagePath,
      String memo,
      List<Tag> tags,
      MetaData? metaData});
}

/// @nodoc
class __$$_InklingCopyWithImpl<$Res>
    extends _$InklingCopyWithImpl<$Res, _$_Inkling>
    implements _$$_InklingCopyWith<$Res> {
  __$$_InklingCopyWithImpl(_$_Inkling _value, $Res Function(_$_Inkling) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hiveId = freezed,
    Object? note = null,
    Object? link = null,
    Object? imagePath = null,
    Object? memo = null,
    Object? tags = null,
    Object? metaData = freezed,
  }) {
    return _then(_$_Inkling(
      hiveId: freezed == hiveId
          ? _value.hiveId
          : hiveId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      metaData: freezed == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as MetaData?,
    ));
  }
}

/// @nodoc

class _$_Inkling implements _Inkling {
  const _$_Inkling(
      {this.hiveId,
      required this.note,
      required this.link,
      required this.imagePath,
      required this.memo,
      required final List<Tag> tags,
      this.metaData})
      : _tags = tags;

  @override
  final int? hiveId;
  @override
  final String note;
  @override
  final String link;
  @override
  final String imagePath;
  @override
  final String memo;
  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final MetaData? metaData;

  @override
  String toString() {
    return 'Inkling(hiveId: $hiveId, note: $note, link: $link, imagePath: $imagePath, memo: $memo, tags: $tags, metaData: $metaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Inkling &&
            (identical(other.hiveId, hiveId) || other.hiveId == hiveId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.metaData, metaData) ||
                other.metaData == metaData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hiveId, note, link, imagePath,
      memo, const DeepCollectionEquality().hash(_tags), metaData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InklingCopyWith<_$_Inkling> get copyWith =>
      __$$_InklingCopyWithImpl<_$_Inkling>(this, _$identity);
}

abstract class _Inkling implements Inkling {
  const factory _Inkling(
      {final int? hiveId,
      required final String note,
      required final String link,
      required final String imagePath,
      required final String memo,
      required final List<Tag> tags,
      final MetaData? metaData}) = _$_Inkling;

  @override
  int? get hiveId;
  @override
  String get note;
  @override
  String get link;
  @override
  String get imagePath;
  @override
  String get memo;
  @override
  List<Tag> get tags;
  @override
  MetaData? get metaData;
  @override
  @JsonKey(ignore: true)
  _$$_InklingCopyWith<_$_Inkling> get copyWith =>
      throw _privateConstructorUsedError;
}
