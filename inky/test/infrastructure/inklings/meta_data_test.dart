import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:inky/infrastructure/infrastructure.dart';

void main() {
  group('MetaData', () {
    test('createFromDocument', () {
      final Document document = Document.html('''
        <!DOCTYPE html>
        <html>
          <head>
            <meta property="og:title" content="Test Title">
            <meta property="og:image" content="https://example.com/image.jpg">
            <meta property="og:url" content="https://example.com">
          </head>
          <body></body>
        </html>
      ''');

      final metaData = MetaData.createFromDocument(document);

      expect(metaData.title, "Test Title");
      expect(metaData.imageUrl, "https://example.com/image.jpg");
      expect(metaData.url, "https://example.com");
    });

    test('createFromDocument returns null for missing tags', () {
      final Document document = Document.html('''
        <!DOCTYPE html>
        <html>
          <head>
          </head>
          <body></body>
        </html>
      ''');

      final metaData = MetaData.createFromDocument(document);

      expect(metaData.title, null);
      expect(metaData.imageUrl, null);
      expect(metaData.url, null);
    });
  });
}
