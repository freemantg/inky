import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/application/application.dart';
import 'package:inky/domain/domain.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:inky/providers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tags_notifier_test.mocks.dart';

@GenerateMocks([TagRepository])
void main() {
  group('TagsNotifier', () {
    late MockTagRepository mockTagRepository;
    late TagsNotifier tagsNotifier;
    late ProviderContainer container;

    setUp(() {
      mockTagRepository = MockTagRepository();
      when(mockTagRepository.streamTags(any)).thenAnswer(
        (_) => Stream.value(right([])), // returns an empty list
      );
      container = ProviderContainer(overrides: [
        tagsNotifierProvider.overrideWith((ref) => tagsNotifier),
      ]);
      tagsNotifier = TagsNotifier(tagRepository: mockTagRepository);
    });

    tearDown(() => container.dispose());

    test('initialises with correct state', () async {
      expect(container.read(tagsNotifierProvider), isA<LoadSuccess>());
    });

    test('streamTags() updates state', () async {
      tagsNotifier.streamTags();
      await Future.delayed(Duration.zero);
      expect(container.read(tagsNotifierProvider), isA<LoadSuccess>());
    });

    group('createTag', () {
      test('should call create method from repository', () async {
        final tag = Tag(id: '1', name: 'tag');
        when(mockTagRepository.create(any))
            .thenAnswer((_) async => right(unit));
        await tagsNotifier.createTag(tag.name);
        verify(mockTagRepository.create(any)).called(1);
      });
    });

    group('deleteTag', () {
      test(
        'should call delete method from repository',
        () async {
          final tag = Tag(id: '1', name: 'tag');
          when(mockTagRepository.delete(tag))
              .thenAnswer((_) async => right(unit));
          await tagsNotifier.deleteTag(tag);
          verify(mockTagRepository.delete(tag)).called(1);
        },
      );
    });

    group('Filter Tags', () {
      test('should add filter tag', () async {
        final tag = Tag(id: '1', name: 'tag');
        tagsNotifier.addFilterTag(tag);
        expect(container.read(tagsNotifierProvider).filter, [tag]);
      });

      test('should remove filter tag', () async {
        final tag = Tag(id: '1', name: 'tag');
        tagsNotifier.addFilterTag(tag);
        tagsNotifier.removeFilterTag(tag);
        expect(container.read(tagsNotifierProvider).filter, isEmpty);
      });
    });
  });
}
