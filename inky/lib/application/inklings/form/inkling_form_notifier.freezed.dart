// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'inkling_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InklingFormState {
  Inkling get inkling => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InklingFormStateCopyWith<InklingFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InklingFormStateCopyWith<$Res> {
  factory $InklingFormStateCopyWith(
          InklingFormState value, $Res Function(InklingFormState) then) =
      _$InklingFormStateCopyWithImpl<$Res>;
  $Res call({Inkling inkling, bool isEditing, bool isSaving});

  $InklingCopyWith<$Res> get inkling;
}

/// @nodoc
class _$InklingFormStateCopyWithImpl<$Res>
    implements $InklingFormStateCopyWith<$Res> {
  _$InklingFormStateCopyWithImpl(this._value, this._then);

  final InklingFormState _value;
  // ignore: unused_field
  final $Res Function(InklingFormState) _then;

  @override
  $Res call({
    Object? inkling = freezed,
    Object? isEditing = freezed,
    Object? isSaving = freezed,
  }) {
    return _then(_value.copyWith(
      inkling: inkling == freezed
          ? _value.inkling
          : inkling // ignore: cast_nullable_to_non_nullable
              as Inkling,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $InklingCopyWith<$Res> get inkling {
    return $InklingCopyWith<$Res>(_value.inkling, (value) {
      return _then(_value.copyWith(inkling: value));
    });
  }
}

/// @nodoc
abstract class _$$_InklingFormStateCopyWith<$Res>
    implements $InklingFormStateCopyWith<$Res> {
  factory _$$_InklingFormStateCopyWith(
          _$_InklingFormState value, $Res Function(_$_InklingFormState) then) =
      __$$_InklingFormStateCopyWithImpl<$Res>;
  @override
  $Res call({Inkling inkling, bool isEditing, bool isSaving});

  @override
  $InklingCopyWith<$Res> get inkling;
}

/// @nodoc
class __$$_InklingFormStateCopyWithImpl<$Res>
    extends _$InklingFormStateCopyWithImpl<$Res>
    implements _$$_InklingFormStateCopyWith<$Res> {
  __$$_InklingFormStateCopyWithImpl(
      _$_InklingFormState _value, $Res Function(_$_InklingFormState) _then)
      : super(_value, (v) => _then(v as _$_InklingFormState));

  @override
  _$_InklingFormState get _value => super._value as _$_InklingFormState;

  @override
  $Res call({
    Object? inkling = freezed,
    Object? isEditing = freezed,
    Object? isSaving = freezed,
  }) {
    return _then(_$_InklingFormState(
      inkling: inkling == freezed
          ? _value.inkling
          : inkling // ignore: cast_nullable_to_non_nullable
              as Inkling,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InklingFormState implements _InklingFormState {
  const _$_InklingFormState(
      {required this.inkling, required this.isEditing, required this.isSaving});

  @override
  final Inkling inkling;
  @override
  final bool isEditing;
  @override
  final bool isSaving;

  @override
  String toString() {
    return 'InklingFormState(inkling: $inkling, isEditing: $isEditing, isSaving: $isSaving)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InklingFormState &&
            const DeepCollectionEquality().equals(other.inkling, inkling) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inkling),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(isSaving));

  @JsonKey(ignore: true)
  @override
  _$$_InklingFormStateCopyWith<_$_InklingFormState> get copyWith =>
      __$$_InklingFormStateCopyWithImpl<_$_InklingFormState>(this, _$identity);
}

abstract class _InklingFormState implements InklingFormState {
  const factory _InklingFormState(
      {required final Inkling inkling,
      required final bool isEditing,
      required final bool isSaving}) = _$_InklingFormState;

  @override
  Inkling get inkling;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  @JsonKey(ignore: true)
  _$$_InklingFormStateCopyWith<_$_InklingFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
