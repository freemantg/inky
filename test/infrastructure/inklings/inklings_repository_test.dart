import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/domain/domain.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inklings_repository_test.mocks.dart';

@GenerateMocks([
  InklingLocalServices,
  InklingRemoteService,
])
void main() {
  group(
    'InklingsRepository',
    () {
      late InklingsRepository inklingsRepository;
      late MockInklingLocalServices mockLocalServices;
      late MockInklingRemoteService mockRemoteService;
      setUp(
        () {
          mockLocalServices = MockInklingLocalServices();
          mockRemoteService = MockInklingRemoteService();
          inklingsRepository = InklingsRepository(
            localServices: mockLocalServices,
            remoteServices: mockRemoteService,
          );
        },
      );

      group(
        'upsert',
        () {
          final inkling = Inkling(
            hiveId: '123',
            note: 'Note',
            link: 'https://example.com',
            imagePath: 'image.jpg',
            tags: [Tag(id: '1', name: 'Tag 1'), Tag(id: '2', name: 'Tag 2')],
            memo: 'Memo',
          );

          test(
            'adds an inkling to the local source',
            () async {
              // Stub the upsert method of the mockLocalServices
              when(mockLocalServices.upsert(any))
                  .thenAnswer((_) => Future.value());

              // Call the upsert method of inklingsRepository
              final result = await inklingsRepository.upsert(inkling);

              // Verify that the upsert method of mockLocalServices was called with the converted InklingDto
              verify(mockLocalServices.upsert(InklingDto.fromDomain(inkling)))
                  .called(1);

              // Expect the result to be Right(unit)
              expect(result, equals(right(unit)));
            },
          );

          test('returns InklingFailure.unableToCreate if an exception occurs',
              () async {
            // Create an Inkling object with Tag objects
            final inkling = Inkling(
              hiveId: '123',
              note: 'Note',
              link: 'https://example.com',
              imagePath: 'image.jpg',
              tags: [Tag(id: '1', name: 'Tag 1'), Tag(id: '2', name: 'Tag 2')],
              memo: 'Memo',
            );

            // Stub the upsert method of the mockLocalServices to throw an exception
            when(mockLocalServices.upsert(any)).thenThrow(Exception());

            // Call the upsert method of inklingsRepository
            final result = await inklingsRepository.upsert(inkling);

            // Verify that the upsert method of mockLocalServices was called with the converted InklingDto
            verify(mockLocalServices.upsert(InklingDto.fromDomain(inkling)))
                .called(1);

            // Expect the result to be Left(InklingFailure.unableToCreate)
            expect(result, equals(left(const InklingFailure.unableToCreate())));
          });

          group('delete', () {
            test('removes an inkling from the local services', () async {
              // Create an Inkling object with Tag objects
              final inkling = Inkling(
                hiveId: '123',
                note: 'Note',
                link: 'https://example.com',
                imagePath: 'image.jpg',
                tags: [
                  Tag(id: '1', name: 'Tag 1'),
                  Tag(id: '2', name: 'Tag 2')
                ],
                memo: 'Memo',
              );

              // Stub the delete method of the mockLocalServices
              when(mockLocalServices.delete(any))
                  .thenAnswer((_) => Future.value());

              // Call the delete method of inklingsRepository
              final result = await inklingsRepository.delete(inkling);

              // Verify that the delete method of mockLocalServices was called with the converted InklingDto
              verify(mockLocalServices.delete(InklingDto.fromDomain(inkling)))
                  .called(1);

              // Expect the result to be Right(unit)
              expect(result, equals(right(unit)));
            });

            test('returns InklingFailure.unableToDelete if an exception occurs',
                () async {
              // Create an Inkling object with Tag objects
              final inkling = Inkling(
                hiveId: '123',
                note: 'Note',
                link: 'https://example.com',
                imagePath: 'image.jpg',
                tags: [
                  Tag(id: '1', name: 'Tag 1'),
                  Tag(id: '2', name: 'Tag 2')
                ],
                memo: 'Memo',
              );

              // Stub the delete method of the mockLocalServices to throw an exception
              when(mockLocalServices.delete(any)).thenThrow(Exception());

              // Call the delete method of inklingsRepository
              final result = await inklingsRepository.delete(inkling);

              // Verify that the delete method of mockLocalServices was called with the converted InklingDto
              verify(mockLocalServices.delete(InklingDto.fromDomain(inkling)))
                  .called(1);

              // Expect the result to be Left(InklingFailure.unableToDelete)
              expect(
                  result, equals(left(const InklingFailure.unableToDelete())));
            });
          });

          test('returns the stream of inklings with metadata', () {
            // Create a list of InklingDto objects with different metadata
            final inklingDtos = [
              const InklingDto(
                hiveId: '1',
                note: 'Note 1',
                link: '',
                imagePath: '',
                tags: [],
                memo: '',
              ),
              const InklingDto(
                hiveId: '2',
                note: 'Note 2',
                link: 'https://example.com',
                imagePath: '',
                tags: [],
                memo: '',
              ),
            ];

            // Create a list of Inkling objects with metadata
            final inklingsWithMetadata = [
              const Inkling(
                hiveId: '1',
                note: 'Note 1',
                link: '',
                imagePath: '',
                tags: [],
                memo: '',
              ),
              const Inkling(
                hiveId: '2',
                note: 'Note 2',
                link: 'https://example.com',
                imagePath: '',
                tags: [],
                memo: '',
                metaData: MetaData(),
              ),
            ];

            // Stub the streamInklings method of the mockLocalServices to return a stream of inklingDtos
            when(mockLocalServices.streamInklings(
              filter: anyNamed('filter'),
              inklingType: anyNamed('inklingType'),
            )).thenAnswer((_) => Stream.value(inklingDtos));

            // Stub the fetchMetaData method of the mockRemoteService to return metadata for inklingDtos[1]
            when(mockRemoteService.fetchMetaData('https://example.com'))
                .thenAnswer((_) => Future.value(right(const MetaData())));

            // Call the watchInklings method of inklingsRepository
            final inklingsStream = inklingsRepository.watchInklings();

            // Expect the stream to emit the expected list of inklings with metadata in order
            expectLater(
              inklingsStream,
              emits(isA<Right<dynamic, List<Inkling>>>().having(
                (result) => result.getOrElse(() => []),
                'inklings',
                inklingsWithMetadata,
              )),
            );
          });
        },
      );
    },
  );
}
