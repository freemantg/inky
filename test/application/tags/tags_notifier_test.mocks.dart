// Mocks generated by Mockito 5.4.1 from annotations
// in inky/test/application/tags/tags_notifier_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:inky/domain/tags/tag.dart' as _i6;
import 'package:inky/domain/tags/tag_failure.dart' as _i5;
import 'package:inky/infrastructure/tags/tags_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TagRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTagRepository extends _i1.Mock implements _i3.TagRepository {
  MockTagRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.TagFailure, _i2.Unit>> create(_i6.Tag? tag) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [tag],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.TagFailure, _i2.Unit>>.value(
            _FakeEither_0<_i5.TagFailure, _i2.Unit>(
          this,
          Invocation.method(
            #create,
            [tag],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.TagFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i5.TagFailure, _i2.Unit>> delete(_i6.Tag? tag) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [tag],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.TagFailure, _i2.Unit>>.value(
            _FakeEither_0<_i5.TagFailure, _i2.Unit>(
          this,
          Invocation.method(
            #delete,
            [tag],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.TagFailure, _i2.Unit>>);
  @override
  _i4.Stream<_i2.Either<_i5.TagFailure, List<_i6.Tag>>> streamTags(
          List<_i6.Tag>? filter) =>
      (super.noSuchMethod(
        Invocation.method(
          #streamTags,
          [filter],
        ),
        returnValue:
            _i4.Stream<_i2.Either<_i5.TagFailure, List<_i6.Tag>>>.empty(),
      ) as _i4.Stream<_i2.Either<_i5.TagFailure, List<_i6.Tag>>>);
}