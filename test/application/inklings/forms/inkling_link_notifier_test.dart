import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/application/application.dart';
import 'package:inky/domain/metadata/meta_data_failure.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:inky/providers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

import 'inkling_link_notifier_test.mocks.dart';

@GenerateMocks([InklingRemoteService])
void main() {
  late ProviderContainer container;
  late MockInklingRemoteService mockInklingRemoteService;
  late InklingLinkNotifier notifier;

  setUp(() {
    mockInklingRemoteService = MockInklingRemoteService();
    container = ProviderContainer(
      overrides: [
        inklingLinkNotifierProvider.overrideWith(
            (ref) => InklingLinkNotifier(mockInklingRemoteService))
      ],
    );
    notifier = container.read(inklingLinkNotifierProvider.notifier);
  });

  group('fetchMetaData', () {
    const tUrl = 'http://test.com';
    const tMetaData =
        MetaData(title: 'test title', imageUrl: 'test image url', url: tUrl);

    test('should change the state to loading when fetchMetaData is called', () {
      // arrange
      when(mockInklingRemoteService.fetchMetaData(any))
          .thenAnswer((_) async => right(tMetaData));
      // act
      notifier.fetchMetaData(url: tUrl);
      // assert
      expect(container.read(inklingLinkNotifierProvider),
          equals(const AsyncValue<MetaData>.loading()));
    });

    test('should update the state to success when fetchMetaData is successful',
        () async {
      // arrange
      when(mockInklingRemoteService.fetchMetaData(any))
          .thenAnswer((_) async => right(tMetaData));
      // act
      await notifier.fetchMetaData(url: tUrl);
      // assert
      expect(container.read(inklingLinkNotifierProvider),
          equals(const AsyncValue.data(tMetaData)));
    });

    test('should update the state to error when fetchMetaData fails', () async {
      when(mockInklingRemoteService.fetchMetaData(any))
          .thenAnswer((_) async => left(const MetaDataFailure.unableToParse()));
      await notifier.fetchMetaData(url: tUrl);
      expect(container.read(inklingLinkNotifierProvider), isA<AsyncError>());
      expect((container.read(inklingLinkNotifierProvider) as AsyncError).error,
          isA<MetaDataFailure>());
    });
  });

  group('clearMetaData', () {
    test('should update the state to loading when clearMetaData is called', () {
      notifier.clearMetaData();
      expect(container.read(inklingLinkNotifierProvider),
          equals(const AsyncValue<MetaData>.loading()));
    });
  });
}
