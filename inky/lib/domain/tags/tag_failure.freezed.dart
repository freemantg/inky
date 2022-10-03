// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() unableToUpdate,
    required TResult Function() unableToCreate,
    required TResult Function() unableToDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
    required TResult Function(_UnableToCreate value) unableToCreate,
    required TResult Function(_UnableToDelete value) unableToDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagFailureCopyWith<$Res> {
  factory $TagFailureCopyWith(
          TagFailure value, $Res Function(TagFailure) then) =
      _$TagFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$TagFailureCopyWithImpl<$Res> implements $TagFailureCopyWith<$Res> {
  _$TagFailureCopyWithImpl(this._value, this._then);

  final TagFailure _value;
  // ignore: unused_field
  final $Res Function(TagFailure) _then;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res> extends _$TagFailureCopyWithImpl<$Res>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, (v) => _then(v as _$_Unexpected));

  @override
  _$_Unexpected get _value => super._value as _$_Unexpected;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Unexpected(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'TagFailure.unexpected(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unexpected &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      __$$_UnexpectedCopyWithImpl<_$_Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() unableToUpdate,
    required TResult Function() unableToCreate,
    required TResult Function() unableToDelete,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
    required TResult Function(_UnableToCreate value) unableToCreate,
    required TResult Function(_UnableToDelete value) unableToDelete,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements TagFailure {
  const factory _Unexpected({final String? message}) = _$_Unexpected;

  String? get message;
  @JsonKey(ignore: true)
  _$$_UnexpectedCopyWith<_$_Unexpected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnableToUpdateCopyWith<$Res> {
  factory _$$_UnableToUpdateCopyWith(
          _$_UnableToUpdate value, $Res Function(_$_UnableToUpdate) then) =
      __$$_UnableToUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnableToUpdateCopyWithImpl<$Res>
    extends _$TagFailureCopyWithImpl<$Res>
    implements _$$_UnableToUpdateCopyWith<$Res> {
  __$$_UnableToUpdateCopyWithImpl(
      _$_UnableToUpdate _value, $Res Function(_$_UnableToUpdate) _then)
      : super(_value, (v) => _then(v as _$_UnableToUpdate));

  @override
  _$_UnableToUpdate get _value => super._value as _$_UnableToUpdate;
}

/// @nodoc

class _$_UnableToUpdate implements _UnableToUpdate {
  const _$_UnableToUpdate();

  @override
  String toString() {
    return 'TagFailure.unableToUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnableToUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() unableToUpdate,
    required TResult Function() unableToCreate,
    required TResult Function() unableToDelete,
  }) {
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
  }) {
    return unableToUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
    required TResult Function(_UnableToCreate value) unableToCreate,
    required TResult Function(_UnableToDelete value) unableToDelete,
  }) {
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
  }) {
    return unableToUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate(this);
    }
    return orElse();
  }
}

abstract class _UnableToUpdate implements TagFailure {
  const factory _UnableToUpdate() = _$_UnableToUpdate;
}

/// @nodoc
abstract class _$$_UnableToCreateCopyWith<$Res> {
  factory _$$_UnableToCreateCopyWith(
          _$_UnableToCreate value, $Res Function(_$_UnableToCreate) then) =
      __$$_UnableToCreateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnableToCreateCopyWithImpl<$Res>
    extends _$TagFailureCopyWithImpl<$Res>
    implements _$$_UnableToCreateCopyWith<$Res> {
  __$$_UnableToCreateCopyWithImpl(
      _$_UnableToCreate _value, $Res Function(_$_UnableToCreate) _then)
      : super(_value, (v) => _then(v as _$_UnableToCreate));

  @override
  _$_UnableToCreate get _value => super._value as _$_UnableToCreate;
}

/// @nodoc

class _$_UnableToCreate implements _UnableToCreate {
  const _$_UnableToCreate();

  @override
  String toString() {
    return 'TagFailure.unableToCreate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnableToCreate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() unableToUpdate,
    required TResult Function() unableToCreate,
    required TResult Function() unableToDelete,
  }) {
    return unableToCreate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
  }) {
    return unableToCreate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
    required TResult orElse(),
  }) {
    if (unableToCreate != null) {
      return unableToCreate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
    required TResult Function(_UnableToCreate value) unableToCreate,
    required TResult Function(_UnableToDelete value) unableToDelete,
  }) {
    return unableToCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
  }) {
    return unableToCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
    required TResult orElse(),
  }) {
    if (unableToCreate != null) {
      return unableToCreate(this);
    }
    return orElse();
  }
}

abstract class _UnableToCreate implements TagFailure {
  const factory _UnableToCreate() = _$_UnableToCreate;
}

/// @nodoc
abstract class _$$_UnableToDeleteCopyWith<$Res> {
  factory _$$_UnableToDeleteCopyWith(
          _$_UnableToDelete value, $Res Function(_$_UnableToDelete) then) =
      __$$_UnableToDeleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnableToDeleteCopyWithImpl<$Res>
    extends _$TagFailureCopyWithImpl<$Res>
    implements _$$_UnableToDeleteCopyWith<$Res> {
  __$$_UnableToDeleteCopyWithImpl(
      _$_UnableToDelete _value, $Res Function(_$_UnableToDelete) _then)
      : super(_value, (v) => _then(v as _$_UnableToDelete));

  @override
  _$_UnableToDelete get _value => super._value as _$_UnableToDelete;
}

/// @nodoc

class _$_UnableToDelete implements _UnableToDelete {
  const _$_UnableToDelete();

  @override
  String toString() {
    return 'TagFailure.unableToDelete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnableToDelete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) unexpected,
    required TResult Function() unableToUpdate,
    required TResult Function() unableToCreate,
    required TResult Function() unableToDelete,
  }) {
    return unableToDelete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
  }) {
    return unableToDelete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? unexpected,
    TResult Function()? unableToUpdate,
    TResult Function()? unableToCreate,
    TResult Function()? unableToDelete,
    required TResult orElse(),
  }) {
    if (unableToDelete != null) {
      return unableToDelete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_UnableToUpdate value) unableToUpdate,
    required TResult Function(_UnableToCreate value) unableToCreate,
    required TResult Function(_UnableToDelete value) unableToDelete,
  }) {
    return unableToDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
  }) {
    return unableToDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_UnableToUpdate value)? unableToUpdate,
    TResult Function(_UnableToCreate value)? unableToCreate,
    TResult Function(_UnableToDelete value)? unableToDelete,
    required TResult orElse(),
  }) {
    if (unableToDelete != null) {
      return unableToDelete(this);
    }
    return orElse();
  }
}

abstract class _UnableToDelete implements TagFailure {
  const factory _UnableToDelete() = _$_UnableToDelete;
}
