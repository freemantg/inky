import 'package:html/dom.dart';

mixin BaseMetaDataParser {
  String? title;
  String? imageUrl;
  String? url;

  MetaData parse() {
    final data = MetaData();
    data.title = title;
    data.imageUrl = imageUrl;
    data.url = url;
    return data;
  }
}

class MetaData with BaseMetaDataParser {}

class MetaDataParser with BaseMetaDataParser {
  MetaDataParser(this.document);
  static const String key = 'content';
  static const String attribute = 'property';
  static const String tag = 'meta';

  final Document document;

  @override
  String? get title => _extractMetaData(document, 'og:title');

  @override
  String? get imageUrl => _extractMetaData(document, 'og:image');

  @override
  String? get url => _extractMetaData(document, 'og:url');

  String? _extractMetaData(Document document, String property) {
    return document
        .getElementsByTagName(tag)
        .cast()
        .firstWhere(
          (meta) => meta.attributes[attribute] == property,
          orElse: () => null,
        )
        .attributes[key];
  }
}
