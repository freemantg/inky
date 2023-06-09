import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/domain/domain.dart';
import 'package:inky/providers.dart';
import 'package:inky/router.dart';

void main() {
  group('InklingFilterNotifier', () {
    late ProviderContainer container;
    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() => container.dispose());

    test(
      'updatefilter should update the filter tags',
      () {
        final notifier = container.read(inklingFilterNotifierProvider.notifier);
        final tags = [Tag(id: '1', name: 'test'), Tag(id: '2', name: 'test')];

        notifier.updateFilter(tags: tags);

        expect(
            container.read(inklingFilterNotifierProvider).filter, equals(tags));
      },
    );

    test('updateFilter with null should not modify the filter', () {
      final notifier = container.read(inklingFilterNotifierProvider.notifier);
      final initialTags = [Tag(id:'1', name: 'tag1'), Tag(id:'2', name: 'tag2')];
      notifier.updateFilter(tags: initialTags);
      
      notifier.updateFilter(tags: null);

      expect(container.read(inklingFilterNotifierProvider).filter,
          equals(initialTags));
    });


    test(
      'removeFilterTag should remove a tag from the filter',
      () {
        final notifier = container.read(inklingFilterNotifierProvider.notifier);
        final tag1 = Tag(id: '1', name: 'test1');
        final tag2 = Tag(id: '2', name: 'test2');
        final initialTags = [tag1, tag2];
        notifier.updateFilter(tags: initialTags);

        notifier.removeFilterTag(tag1);

        expect(container.read(inklingFilterNotifierProvider).filter,
            equals([tag2]));
      },
    );

    test('removeFilterTag with non-existent tag should not modify the filter',
        () {
      final notifier = container.read(inklingFilterNotifierProvider.notifier);
      final tag1 = Tag(id: '1', name: 'tag1');
      final tag2 = Tag(id: '2', name: 'tag2');
      final initialTags = [tag1, tag2];

      notifier.updateFilter(tags: initialTags);
      final nonExistentTag = Tag(id: '3', name: 'tag3');

      notifier.removeFilterTag(nonExistentTag);

      expect(container.read(inklingFilterNotifierProvider).filter,
          equals(initialTags));
    });

    test('toggleInklingType should update the Inkling type filter', () {
      final notifier = container.read(inklingFilterNotifierProvider.notifier);
      const type = InklingType.note;

      notifier.toggleInklingType(type);
      expect(container.read(inklingFilterNotifierProvider).typeFilter,
          equals(type));
    });

    test('multiple updates should maintain the correct state', () {
      final notifier = container.read(inklingFilterNotifierProvider.notifier);
      final tags1 = [Tag(id: '1', name: 'tag1'), Tag(id: '2', name: 'tag2')];
      final tags2 = [Tag(id: '3', name: 'tag3'), Tag(id: '4', name: 'tag4')];

      const type1 = InklingType.image;
      const type2 = InklingType.note;

      notifier.updateFilter(tags: tags1);
      notifier.toggleInklingType(type1);
      notifier.updateFilter(tags: tags2);
      notifier.toggleInklingType(type2);

      final state = container.read(inklingFilterNotifierProvider);
      expect(state.filter, equals(tags2));
      expect(state.typeFilter, equals(type2));
    });
  });
}
