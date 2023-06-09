// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(List<Tag>? filter)? initial,
    TResult? Function(List<Tag>? filter)? loadInProgress,
    TResult? Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult? Function(TagFailure failure, List<Tag>? filter)? loadFailure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(Failure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(Failure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(Failure value)? loadFailure,
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
      _$TagsStateCopyWithImpl<$Res, TagsState>;
  @useResult
  $Res call({List<Tag>? filter});
}

/// @nodoc
class _$TagsStateCopyWithImpl<$Res, $Val extends TagsState>
    implements $TagsStateCopyWith<$Res> {
  _$TagsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag>? filter});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$Initial(
      filter: freezed == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({final List<Tag>? filter}) : _filter = filter;

  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    if (_filter is EqualUnmodifiableListView) return _filter;
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
            other is _$Initial &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

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
    TResult? Function(List<Tag>? filter)? initial,
    TResult? Function(List<Tag>? filter)? loadInProgress,
    TResult? Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult? Function(TagFailure failure, List<Tag>? filter)? loadFailure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(Failure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(Failure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements TagsState {
  const factory Initial({final List<Tag>? filter}) = _$Initial;

  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadInProgressCopyWith<$Res>
    implements $TagsStateCopyWith<$Res> {
  factory _$$LoadInProgressCopyWith(
          _$LoadInProgress value, $Res Function(_$LoadInProgress) then) =
      __$$LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag>? filter});
}

/// @nodoc
class __$$LoadInProgressCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res, _$LoadInProgress>
    implements _$$LoadInProgressCopyWith<$Res> {
  __$$LoadInProgressCopyWithImpl(
      _$LoadInProgress _value, $Res Function(_$LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
  }) {
    return _then(_$LoadInProgress(
      filter: freezed == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$LoadInProgress implements LoadInProgress {
  const _$LoadInProgress({final List<Tag>? filter}) : _filter = filter;

  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    if (_filter is EqualUnmodifiableListView) return _filter;
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
            other is _$LoadInProgress &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadInProgressCopyWith<_$LoadInProgress> get copyWith =>
      __$$LoadInProgressCopyWithImpl<_$LoadInProgress>(this, _$identity);

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
    TResult? Function(List<Tag>? filter)? initial,
    TResult? Function(List<Tag>? filter)? loadInProgress,
    TResult? Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult? Function(TagFailure failure, List<Tag>? filter)? loadFailure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(Failure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(Failure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class LoadInProgress implements TagsState {
  const factory LoadInProgress({final List<Tag>? filter}) = _$LoadInProgress;

  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$LoadInProgressCopyWith<_$LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSuccessCopyWith<$Res>
    implements $TagsStateCopyWith<$Res> {
  factory _$$LoadSuccessCopyWith(
          _$LoadSuccess value, $Res Function(_$LoadSuccess) then) =
      __$$LoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag> tags, List<Tag>? filter});
}

/// @nodoc
class __$$LoadSuccessCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res, _$LoadSuccess>
    implements _$$LoadSuccessCopyWith<$Res> {
  __$$LoadSuccessCopyWithImpl(
      _$LoadSuccess _value, $Res Function(_$LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? filter = freezed,
  }) {
    return _then(_$LoadSuccess(
      null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      filter: freezed == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(final List<Tag> tags, {final List<Tag>? filter})
      : _tags = tags,
        _filter = filter;

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    if (_filter is EqualUnmodifiableListView) return _filter;
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
            other is _$LoadSuccess &&
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
  @pragma('vm:prefer-inline')
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      __$$LoadSuccessCopyWithImpl<_$LoadSuccess>(this, _$identity);

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
    TResult? Function(List<Tag>? filter)? initial,
    TResult? Function(List<Tag>? filter)? loadInProgress,
    TResult? Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult? Function(TagFailure failure, List<Tag>? filter)? loadFailure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(Failure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(Failure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements TagsState {
  const factory LoadSuccess(final List<Tag> tags, {final List<Tag>? filter}) =
      _$LoadSuccess;

  List<Tag> get tags;
  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$LoadSuccessCopyWith<_$LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$FailureCopyWith(_$Failure value, $Res Function(_$Failure) then) =
      __$$FailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TagFailure failure, List<Tag>? filter});

  $TagFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$FailureCopyWithImpl<$Res>
    extends _$TagsStateCopyWithImpl<$Res, _$Failure>
    implements _$$FailureCopyWith<$Res> {
  __$$FailureCopyWithImpl(_$Failure _value, $Res Function(_$Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? filter = freezed,
  }) {
    return _then(_$Failure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as TagFailure,
      filter: freezed == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TagFailureCopyWith<$Res> get failure {
    return $TagFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$Failure implements Failure {
  const _$Failure(this.failure, {final List<Tag>? filter}) : _filter = filter;

  @override
  final TagFailure failure;
  final List<Tag>? _filter;
  @override
  List<Tag>? get filter {
    final value = _filter;
    if (value == null) return null;
    if (_filter is EqualUnmodifiableListView) return _filter;
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
            other is _$Failure &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._filter, _filter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, failure, const DeepCollectionEquality().hash(_filter));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCopyWith<_$Failure> get copyWith =>
      __$$FailureCopyWithImpl<_$Failure>(this, _$identity);

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
    TResult? Function(List<Tag>? filter)? initial,
    TResult? Function(List<Tag>? filter)? loadInProgress,
    TResult? Function(List<Tag> tags, List<Tag>? filter)? loadSuccess,
    TResult? Function(TagFailure failure, List<Tag>? filter)? loadFailure,
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
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(Failure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(Failure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class Failure implements TagsState {
  const factory Failure(final TagFailure failure, {final List<Tag>? filter}) =
      _$Failure;

  TagFailure get failure;
  @override
  List<Tag>? get filter;
  @override
  @JsonKey(ignore: true)
  _$$FailureCopyWith<_$Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
