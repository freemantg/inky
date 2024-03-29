// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inkling_filter_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InklingFilterState {
  List<Tag> get filter => throw _privateConstructorUsedError;
  InklingType? get typeFilter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InklingFilterStateCopyWith<InklingFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InklingFilterStateCopyWith<$Res> {
  factory $InklingFilterStateCopyWith(
          InklingFilterState value, $Res Function(InklingFilterState) then) =
      _$InklingFilterStateCopyWithImpl<$Res, InklingFilterState>;
  @useResult
  $Res call({List<Tag> filter, InklingType? typeFilter});
}

/// @nodoc
class _$InklingFilterStateCopyWithImpl<$Res, $Val extends InklingFilterState>
    implements $InklingFilterStateCopyWith<$Res> {
  _$InklingFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? typeFilter = freezed,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      typeFilter: freezed == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as InklingType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InklingFilterStateCopyWith<$Res>
    implements $InklingFilterStateCopyWith<$Res> {
  factory _$$_InklingFilterStateCopyWith(_$_InklingFilterState value,
          $Res Function(_$_InklingFilterState) then) =
      __$$_InklingFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag> filter, InklingType? typeFilter});
}

/// @nodoc
class __$$_InklingFilterStateCopyWithImpl<$Res>
    extends _$InklingFilterStateCopyWithImpl<$Res, _$_InklingFilterState>
    implements _$$_InklingFilterStateCopyWith<$Res> {
  __$$_InklingFilterStateCopyWithImpl(
      _$_InklingFilterState _value, $Res Function(_$_InklingFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? typeFilter = freezed,
  }) {
    return _then(_$_InklingFilterState(
      filter: null == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      typeFilter: freezed == typeFilter
          ? _value.typeFilter
          : typeFilter // ignore: cast_nullable_to_non_nullable
              as InklingType?,
    ));
  }
}

/// @nodoc

class _$_InklingFilterState implements _InklingFilterState {
  const _$_InklingFilterState(
      {required final List<Tag> filter, this.typeFilter})
      : _filter = filter;

  final List<Tag> _filter;
  @override
  List<Tag> get filter {
    if (_filter is EqualUnmodifiableListView) return _filter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filter);
  }

  @override
  final InklingType? typeFilter;

  @override
  String toString() {
    return 'InklingFilterState(filter: $filter, typeFilter: $typeFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InklingFilterState &&
            const DeepCollectionEquality().equals(other._filter, _filter) &&
            (identical(other.typeFilter, typeFilter) ||
                other.typeFilter == typeFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filter), typeFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InklingFilterStateCopyWith<_$_InklingFilterState> get copyWith =>
      __$$_InklingFilterStateCopyWithImpl<_$_InklingFilterState>(
          this, _$identity);
}

abstract class _InklingFilterState implements InklingFilterState {
  const factory _InklingFilterState(
      {required final List<Tag> filter,
      final InklingType? typeFilter}) = _$_InklingFilterState;

  @override
  List<Tag> get filter;
  @override
  InklingType? get typeFilter;
  @override
  @JsonKey(ignore: true)
  _$$_InklingFilterStateCopyWith<_$_InklingFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
