import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../tags/tags_local_source_test.mocks.dart';

@GenerateMocks([Box<InklingDto>])
void main() {
  group(
    'InklingLocalServices',
    () {
      late InklingLocalServices inklingLocalServices;
      late MockBox<InklingDto> mockInklingDtoBox;

      setUp(
        () {
          mockInklingDtoBox = MockBox<InklingDto>();
          inklingLocalServices = InklingLocalServices(mockInklingDtoBox);
        },
      );

      test(
        'streamInklings return initial inklings',
        () {
          final initialInklings = [
            const InklingDto(
                hiveId: '1',
                note: 'Note 1',
                link: '',
                imagePath: '',
                tags: [],
                memo: ''),
            const InklingDto(
                hiveId: '2',
                note: '',
                link: '',
                imagePath: 'image1.jpg',
                tags: [],
                memo: ''),
            const InklingDto(
                hiveId: '3',
                note: '',
                link: 'https://example.com',
                imagePath: '',
                tags: [],
                memo: ''),
          ];
          when(mockInklingDtoBox.values).thenReturn(initialInklings);
          when(mockInklingDtoBox.watch()).thenAnswer(
              (_) => Stream.value(BoxEvent('testBox', null, false)));
          final inklingsStream = inklingLocalServices.streamInklings();
          expect(inklingsStream, emits(initialInklings));
        },
      );

      // test('streamInklings filters inklings by InklingType', () {
      //   // Create a list of inklings with different types
      //   final inklings = [
      //     const InklingDto(
      //         hiveId: '1',
      //         note: 'Note 1',
      //         link: '',
      //         imagePath: '',
      //         tags: [],
      //         memo: ''),
      //     const InklingDto(
      //         hiveId: '2',
      //         note: '',
      //         link: '',
      //         imagePath: 'image1.jpg',
      //         tags: [],
      //         memo: ''),
      //     const InklingDto(
      //         hiveId: '3',
      //         note: '',
      //         link: 'https://example.com',
      //         imagePath: '',
      //         tags: [],
      //         memo: ''),
      //   ];

      //   // Stub the values and watch methods of the mockBox
      //   when(mockInklingDtoBox.values).thenReturn(inklings);
      //   when(mockInklingDtoBox.watch())
      //       .thenAnswer((_) => Stream.value(BoxEvent('testBox', null, false)));

      //   // Call the streamInklings method with InklingType.image
      //   final inklingsStream =
      //       inklingLocalServices.streamInklings(inklingType: InklingType.image);

      //   // Expect the stream to emit only inklings with non-empty imagePath
      //   expect(inklingsStream, emits([inklings[1]]));
      // });

      test('upsert adds an InklingDto to the box', () async {
        // Create a new InklingDto
        const dto = InklingDto(
          hiveId: '123',
          note: 'New Note',
          link: '',
          imagePath: '',
          tags: [],
          memo: '',
        );
        await inklingLocalServices.upsert(dto);
        verify(mockInklingDtoBox.put(dto.hiveId, dto)).called(1);
      });

      test('delete removes an InklingDto from the box', () async {
        // Create an existing InklingDto
        const dto = InklingDto(
          hiveId: '123',
          note: 'Note 1',
          link: '',
          imagePath: '',
          tags: [],
          memo: '',
        );
        // Call the delete method
        await inklingLocalServices.delete(dto);
        // Verify that delete method of the box was called with the dto's hiveId
        verify(mockInklingDtoBox.delete(dto.hiveId)).called(1);
      });
    },
  );
}
