import 'package:freezed_annotation/freezed_annotation.dart';

import '../tags/tag.dart';

part 'inkling.freezed.dart';

@freezed
class Inkling with _$Inkling {
  const factory Inkling({
    required String note,
    required String link,
    required String memo,
    required List<Tag> tags,
  }) = _Inkling;

  factory Inkling.empty() => Inkling(
        note: '',
        link: '',
        memo: '',
        tags: List.empty(growable: true),
      );
}
