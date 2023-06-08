import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data_failure.freezed.dart';

@freezed
class MetaDataFailure with _$MetaDataFailure {
  const factory MetaDataFailure.unableToParse() = UnableToParse;
  const factory MetaDataFailure.invalidDocument() = InvalidDocument;
  const factory MetaDataFailure.missingProperty(String property) =
      MissingProperty;
  const factory MetaDataFailure.unexpected({
    String? message,
    int? statusCode,
  }) = Unexpected;
}
