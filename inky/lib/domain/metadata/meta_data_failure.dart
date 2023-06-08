import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data_failure.freezed.dart';

@freezed
class MetaDataFailure with _$MetaDataFailure {
  const factory MetaDataFailure.unableToParse() = _UnableToParse;
  const factory MetaDataFailure.invalidDocument() = _InvalidDocument;
  const factory MetaDataFailure.missingProperty(String property) =
      _MissingProperty;
  const factory MetaDataFailure.unexpected({required String message}) =
      _Unexpected;
}
