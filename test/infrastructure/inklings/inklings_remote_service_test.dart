import 'package:flutter_test/flutter_test.dart';
import 'package:inky/domain/metadata/meta_data_failure.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'inklings_remote_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('InklingRemoteService', () {
    late http.Client client;
    late InklingRemoteService remoteService;

    setUp(
      () {
        client = MockClient();
        remoteService = InklingRemoteService(client);
      },
    );

    test('fetchMetaData returns metaData when all meta tags are present',
        () async {
      when(client.get(Uri.parse('https://example.com')))
          .thenAnswer((_) async => http.Response('''
        <html>
          <head>
            <meta property="og:title" content="Test Title">
            <meta property="og:image" content="https://example.com/image.jpg">
            <meta property="og:url" content="https://example.com">
          </head>
          <body></body>
        </html>
      ''', 200));

      final result = await remoteService.fetchMetaData('https://example.com');
      expect(result.isRight(), true);
      result.fold((l) => null, (r) {
        expect(r.title, "Test Title");
        expect(r.imageUrl, "https://example.com/image.jpg");
        expect(r.url, "https://example.com");
      });
    });
    test('fetchMetaData returns failure when a meta tag is missing', () async {
      when(client.get(Uri.parse('https://example.com')))
          .thenAnswer((_) async => http.Response('''
    <html>
      <head>
        <meta property="og:title" content="Test Title">
        <meta property="og:image" content="https://example.com/image.jpg">
        <!-- Missing og:url tag -->
      </head>
      <body></body>
    </html>
  ''', 200));

      final result = await remoteService.fetchMetaData('https://example.com');

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<MetaDataFailure>());
        expect((failure as MissingProperty).property, 'og:url');
      }, (_) {});
    });

    test('fetchMetaData returns failure when status code is not 200', () async {
      when(client.get(Uri.parse('https://example.com')))
          .thenAnswer((_) async => http.Response('', 404));

      final result = await remoteService.fetchMetaData('https://example.com');

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<MetaDataFailure>());
      }, (_) {});
    });

    test('fetchMetaData returns failure when an exception is thrown', () async {
      when(client.get(Uri.parse('https://example.com')))
          .thenThrow(Exception('Failed to load URL'));

      final result = await remoteService.fetchMetaData('https://example.com');

      expect(result.isLeft(), true);
      result.fold((failure) {
        expect(failure, isA<MetaDataFailure>());
        expect(
            (failure as Unexpected).message, 'Exception: Failed to load URL');
      }, (_) {});
    });
  });
}
