import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_failure.freezed.dart';

@freezed
abstract class TagFailure with _$TagFailure {
  const factory TagFailure.unexpected({String? message}) = _Unexpected;
  const factory TagFailure.unableToUpdate() = _UnableToUpdate;
  const factory TagFailure.unableToCreate() = _UnableToCreate;
  const factory TagFailure.unableToDelete() = _UnableToDelete;
}
