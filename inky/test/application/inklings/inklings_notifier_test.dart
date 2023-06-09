import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/application/application.dart';
import 'package:inky/domain/domain.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:inky/providers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inklings_notifier_test.mocks.dart';

@GenerateMocks([InklingsRepository])
void main() {
  group('InklingsNotifier', () {
    late MockInklingsRepository mockRepository;
    late ProviderContainer container;

    setUp(() {
      mockRepository = MockInklingsRepository();
      container = ProviderContainer(overrides: [
        inklingsNotifierProvider
            .overrideWith((ref) => InklingsNotifier(mockRepository))
      ]);
    });

    tearDown(() => container.dispose());

    group('watchInklings', () {
      test(
          'should emit loadInProgress state and then loadSuccess state when successful',
          () async {
        final inklings = [
          Inkling(
              hiveId: '1',
              note: '',
              link: '',
              imagePath: '',
              memo: '',
              tags: List.empty(growable: true)),
          Inkling(
              hiveId: '2',
              note: '',
              link: '',
              imagePath: '',
              memo: '',
              tags: List.empty(growable: true))
        ];
        when(mockRepository.watchInklings(
                filter: anyNamed('filter'),
                inklingType: anyNamed('inklingType')))
            .thenAnswer((_) => Stream.value(Right(inklings)));

        container.read(inklingsNotifierProvider.notifier).watchInklings();

        expect(container.read(inklingsNotifierProvider),
            const InklingsState.loadInProgress());
        await Future.delayed(Duration.zero);
        expect(container.read(inklingsNotifierProvider),
            InklingsState.loadSuccess(inklings: inklings));
      });
    });

    test(
        'should emit loadInProgress state and then loadFailure state when there is a failure',
        () async {
      const failure = InklingFailure.unexpected(message: 'Failed');
      when(mockRepository.watchInklings(
              filter: anyNamed('filter'), inklingType: anyNamed('inklingType')))
          .thenAnswer((_) => Stream.value(const Left(failure)));

      container.read(inklingsNotifierProvider.notifier).watchInklings();

      expect(container.read(inklingsNotifierProvider),
          const InklingsState.loadInProgress());

      await Future.delayed(Duration.zero);

      expect(container.read(inklingsNotifierProvider),
          const InklingsState.loadFailure(failure: failure));
    });

    test('should emit loadFailure state when an error occurs in the stream',
        () async {
      final error = Exception('Error');
      when(mockRepository.watchInklings(
              filter: anyNamed('filter'), inklingType: anyNamed('inklingType')))
          .thenThrow(error);

      container.read(inklingsNotifierProvider.notifier).watchInklings();
      expect(
          container.read(inklingsNotifierProvider),
          InklingsState.loadFailure(
            failure:
                InklingFailure.unexpected(message: 'Unexpected error: $error'),
          ));
    });

    group('deleteInkling', () {
      test('should update state when delete is successful', () async {
        final inkling = Inkling.empty();
        when(mockRepository.watchInklings(
                filter: anyNamed('filter'),
                inklingType: anyNamed('inklingType')))
            .thenAnswer((_) => Stream.value(const Right([])));
        when(mockRepository.delete(inkling))
            .thenAnswer((_) async => const Right(unit));

        await container
            .read(inklingsNotifierProvider.notifier)
            .deleteInkling(inkling);

        expect(container.read(inklingsNotifierProvider),
            const InklingsState.loadSuccess(inklings: []));
      });

      test('should update state when delete fails', () async {
        final inkling = Inkling.empty();
        const failure = InklingFailure.unexpected(message: 'Failed');
        when(mockRepository.watchInklings(
                filter: anyNamed('filter'),
                inklingType: anyNamed('inklingType')))
            .thenAnswer((_) => Stream.value(Right([inkling])));
        when(mockRepository.delete(inkling))
            .thenAnswer((_) async => const Left(failure));

        await container
            .read(inklingsNotifierProvider.notifier)
            .deleteInkling(inkling);

        expect(container.read(inklingsNotifierProvider),
            const InklingsState.loadFailure(failure: failure));
      });
    });
  });
}
