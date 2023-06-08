import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tags_local_source_test.mocks.dart';

@GenerateMocks([Box<TagDto>])
void main() {
  group('TagsLocalService', () {
    late MockBox<TagDto> mockBox;
    late TagsLocalService tagsLocalService;
    late TagDto tagDto;

    setUp(
      () {
        mockBox = MockBox<TagDto>();
        tagsLocalService = TagsLocalService(mockBox);
        tagDto = TagDto(id: '123', name: 'test');
      },
    );
    test('insert should call put if tag does not exist and name is not empty',
        () async {
      when(mockBox.containsKey(any)).thenReturn(false);
      await tagsLocalService.insert(tagDto);
      verify(mockBox.put(tagDto.id, tagDto)).called(1);
    });

    test(
      'delete should call delete if tag exists',
      () async {
        when(mockBox.containsKey(any)).thenReturn(true);
        await tagsLocalService.delete(tagDto);
        verify(mockBox.delete(tagDto.id)).called(1);
      },
    );

    test('streamTags should return a stream of tags', () async {
      when(mockBox.watch())
          .thenAnswer((_) => Stream.value(BoxEvent(tagDto.id, tagDto, false)));
      when(mockBox.values).thenReturn([tagDto]);

      expectLater(tagsLocalService.streamTags(), emits([tagDto]));
    });
  });
}
