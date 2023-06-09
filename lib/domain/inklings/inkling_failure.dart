import 'package:freezed_annotation/freezed_annotation.dart';

part 'inkling_failure.freezed.dart';

@freezed
abstract class InklingFailure with _$InklingFailure {
  const factory InklingFailure.unexpected({String? message}) = Unexpected;
  const factory InklingFailure.unableToUpdate() = UnableToUpdate;
  const factory InklingFailure.unableToCreate() = UnableToCreate;
  const factory InklingFailure.unableToDelete() = UnableToDelete;
}
