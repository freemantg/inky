import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

@freezed
abstract class Tag with _$Tag {
  factory Tag({
    required String id,
    required String name,
  }) = _Tag;
}
