import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/domain/tags/tags.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tags_repository_test.mocks.dart';

@GenerateMocks([TagsLocalService])
void main() {
  group(
    'TagRepository',
    () {
      late MockTagsLocalService mockTagsLocalService;
      late TagRepository tagRepository;
      late Tag tag;
      late TagDto tagDto;

      setUp(
        () {
          mockTagsLocalService = MockTagsLocalService();
          tagRepository = TagRepository(mockTagsLocalService);
          tag = Tag(id: '123', name: 'test');
          tagDto = TagDto.fromDomain(tag);
        },
      );

      test('create should return right unit when successful', () async {
        when(mockTagsLocalService.insert(any)).thenAnswer((_) async {});

        var result = await tagRepository.create(tag);

        expect(result, equals(right(unit)));
      });

      test('create should return left TagFailure when exception is thrown',
          () async {
        when(mockTagsLocalService.insert(any)).thenThrow(Exception());

        var result = await tagRepository.create(tag);

        expect(result, equals(left(const TagFailure.unableToCreate())));
      });

      test('delete should return right unit when successful', () async {
        when(mockTagsLocalService.delete(any)).thenAnswer((_) async {});

        var result = await tagRepository.delete(tag);

        expect(result, equals(right(unit)));
      });

      test('delete should return left TagFailure when exception is thrown',
          () async {
        when(mockTagsLocalService.delete(any)).thenThrow(Exception());

        var result = await tagRepository.delete(tag);

        expect(result, equals(left(const TagFailure.unableToDelete())));
      });

      Matcher isRightWith(List<Tag> value) {
        return predicate<Either<TagFailure, List<Tag>>>(
          (either) => either.fold((l) => false, (r) => listEquals(r, value)),
          'is a Right with $value',
        );
      }

      test('streamTags should return right list of tags when successful',
          () async {
        when(mockTagsLocalService.streamTags(filter: anyNamed('filter')))
            .thenAnswer((_) => Stream.value([tagDto]));

        var result = await tagRepository.streamTags(null).first;

        expect(result, isRightWith([tag]));
      });

      test(
          'streamTags should return a stream of left TagFailure when exception is thrown',
          () {
        when(mockTagsLocalService.streamTags(filter: anyNamed('filter')))
            .thenAnswer((_) => Stream.value([TagDto.fromDomain(tag)])
                .map((event) => throw const TagFailure.unexpected()));

        var result = tagRepository.streamTags([tag]);

        expectLater(result, emitsError(isA<TagFailure>()));
      });

    },
  );
}
