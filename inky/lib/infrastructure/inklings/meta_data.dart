import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/dom.dart';


part 'meta_data.freezed.dart';

@freezed
class MetaData with _$MetaData {
  const factory MetaData({String? title, String? imageUrl, String? url}) =
      _MetaData;

  static MetaData createFromDocument(Document document) {
    final title = _extractMetaData(document, 'og:title');
    final imageUrl = _extractMetaData(document, 'og:image');
    final url = _extractMetaData(document, 'og:url');

    return MetaData(title: title, imageUrl: imageUrl, url: url);
  }

  static String? _extractMetaData(Document document, String property) {
    return document
        .getElementsByTagName('meta')
        .cast()
        .firstWhere(
          (meta) => meta.attributes['property'] == property,
          orElse: () => null,
        )
        ?.attributes['content'];
  }
}
