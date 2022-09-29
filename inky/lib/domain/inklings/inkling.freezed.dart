// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inkling.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Inkling {
  String get note => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InklingCopyWith<Inkling> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InklingCopyWith<$Res> {
  factory $InklingCopyWith(Inkling value, $Res Function(Inkling) then) =
      _$InklingCopyWithImpl<$Res>;
  $Res call({String note, String link, String memo, List<Tag> tags});
}

/// @nodoc
class _$InklingCopyWithImpl<$Res> implements $InklingCopyWith<$Res> {
  _$InklingCopyWithImpl(this._value, this._then);

  final Inkling _value;
  // ignore: unused_field
  final $Res Function(Inkling) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? link = freezed,
    Object? memo = freezed,
    Object? tags = freezed,
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
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
abstract class _$$_InklingCopyWith<$Res> implements $InklingCopyWith<$Res> {
  factory _$$_InklingCopyWith(
          _$_Inkling value, $Res Function(_$_Inkling) then) =
      __$$_InklingCopyWithImpl<$Res>;
  @override
  $Res call({String note, String link, String memo, List<Tag> tags});
}

/// @nodoc
class __$$_InklingCopyWithImpl<$Res> extends _$InklingCopyWithImpl<$Res>
    implements _$$_InklingCopyWith<$Res> {
  __$$_InklingCopyWithImpl(_$_Inkling _value, $Res Function(_$_Inkling) _then)
      : super(_value, (v) => _then(v as _$_Inkling));

  @override
  _$_Inkling get _value => super._value as _$_Inkling;

  @override
  $Res call({
    Object? note = freezed,
    Object? link = freezed,
    Object? memo = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_Inkling(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$_Inkling implements _Inkling {
  const _$_Inkling(
      {required this.note,
      required this.link,
      required this.memo,
      required final List<Tag> tags})
      : _tags = tags;

  @override
  final String note;
  @override
  final String link;
  @override
  final String memo;
  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'Inkling(note: $note, link: $link, memo: $memo, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Inkling &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_InklingCopyWith<_$_Inkling> get copyWith =>
      __$$_InklingCopyWithImpl<_$_Inkling>(this, _$identity);
}

abstract class _Inkling implements Inkling {
  const factory _Inkling(
      {required final String note,
      required final String link,
      required final String memo,
      required final List<Tag> tags}) = _$_Inkling;

  @override
  String get note;
  @override
  String get link;
  @override
  String get memo;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_InklingCopyWith<_$_Inkling> get copyWith =>
      throw _privateConstructorUsedError;
}
