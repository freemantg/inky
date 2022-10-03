// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tags_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagsState {
  List<Tag>? get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Tag>? filter) initial,
    required TResult Function(List<Tag>? filter) loadInProgress,
    required TResult Function(List<Tag> tags, List<Tag>? filter) loadSuccess,
    required TResult Function(TagFailure failure, List<Tag>? filter)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagsStateCopyWith<TagsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsStateCopyWith<$Res> {
  factory $TagsStateCopyWith(TagsState value, $Res Function(TagsState) then) =
      _$TagsStateCopyWithImpl<$Res>;
  $Res call({List<Tag>? filter});
}

/// @nodoc
class _$TagsStateCopyWithImpl<$Res> implements $TagsStateCopyWith<$Res> {
  _$TagsStateCopyWithImpl(this._value, this._then);

  final TagsState _value;
  // ignore: unused_field
  final $Res Function(TagsState) _then;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      filter: filter == freezed
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<Tag>? filter});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$_Initial(
      filter: filter == freezed
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({final List<Tag>? filter}) : _filter = filter;

  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TagsState.initial(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Tag>? filter) initial,
    required TResult Function(List<Tag>? filter) loadInProgress,
    required TResult Function(List<Tag> tags, List<Tag>? filter) loadSuccess,
    required TResult Function(TagFailure failure, List<Tag>? filter)
        loadFailure,
  }) {
    return initial(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
  }) {
    return initial?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TagsState {
  const factory _Initial({final List<Tag>? filter}) = _$_Initial;

  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $TagsStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({List<Tag>? filter});
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _$_LoadInProgress));

  @override
  _$_LoadInProgress get _value => super._value as _$_LoadInProgress;

  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$_LoadInProgress(
      filter: filter == freezed
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress({final List<Tag>? filter}) : _filter = filter;

  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TagsState.loadInProgress(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Tag>? filter) initial,
    required TResult Function(List<Tag>? filter) loadInProgress,
    required TResult Function(List<Tag> tags, List<Tag>? filter) loadSuccess,
    required TResult Function(TagFailure failure, List<Tag>? filter)
        loadFailure,
  }) {
    return loadInProgress(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
  }) {
    return loadInProgress?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements TagsState {
  const factory _LoadInProgress({final List<Tag>? filter}) = _$_LoadInProgress;

  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $TagsStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<Tag> tags, List<Tag>? filter});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res> extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_LoadSuccess));

  @override
  _$_LoadSuccess get _value => super._value as _$_LoadSuccess;

  @override
  $Res call({
    Object? tags = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$_LoadSuccess(
      tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      filter: filter == freezed
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(final List<Tag> tags, {final List<Tag>? filter})
      : _tags = tags,
        _filter = filter;

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TagsState.loadSuccess(tags: $tags, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Tag>? filter) initial,
    required TResult Function(List<Tag>? filter) loadInProgress,
    required TResult Function(List<Tag> tags, List<Tag>? filter) loadSuccess,
    required TResult Function(TagFailure failure, List<Tag>? filter)
        loadFailure,
  }) {
    return loadSuccess(tags, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
  }) {
    return loadSuccess?.call(tags, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(tags, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements TagsState {
  const factory _LoadSuccess(final List<Tag> tags, {final List<Tag>? filter}) =
      _$_LoadSuccess;

  List<Tag> get tags;
  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @override
  $Res call({TagFailure failure, List<Tag>? filter});

  $TagFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res> extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, (v) => _then(v as _$_Failure));

  @override
  _$_Failure get _value => super._value as _$_Failure;

  @override
  $Res call({
    Object? failure = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$_Failure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as TagFailure,
      filter: filter == freezed
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }

  @override
  $TagFailureCopyWith<$Res> get failure {
    return $TagFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.failure, {final List<Tag>? filter}) : _filter = filter;

  @override
  final TagFailure failure;
  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TagsState.loadFailure(failure: $failure, filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failure),
      const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Tag>? filter) initial,
    required TResult Function(List<Tag>? filter) loadInProgress,
    required TResult Function(List<Tag> tags, List<Tag>? filter) loadSuccess,
    required TResult Function(TagFailure failure, List<Tag>? filter)
        loadFailure,
  }) {
    return loadFailure(failure, filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
  }) {
    return loadFailure?.call(failure, filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tag>? filter)? initial,
    TResult Function(List<Tag>? filter)? loadInProgress,
    TResult Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult Function(TagFailure failure, List<Tag>? filter)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements TagsState {
  const factory _Failure(final TagFailure failure, {final List<Tag>? filter}) =
      _$_Failure;

  TagFailure get failure;
  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
