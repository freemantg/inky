import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/inklings/meta_data_parser_repository.dart';
import '../tags/tag.dart';

part 'inkling.freezed.dart';

@freezed
class Inkling with _$Inkling {
  const factory Inkling({
    required String note,
    required String link,
    required String imagePath,
    required String memo,
    required List<Tag> tags,
    MetaData? metaData,
  }) = _Inkling;

  factory Inkling.empty() => Inkling(
        note: '',
        link: '',
        imagePath: '',
        memo: '',
        tags: List.empty(growable: true),
      );
}
