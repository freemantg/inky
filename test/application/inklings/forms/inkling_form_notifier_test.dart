import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inky/domain/domain.dart';
import 'package:inky/infrastructure/infrastructure.dart';
import 'package:inky/providers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'inkling_form_notifier_test.mocks.dart';

@GenerateMocks([
  InklingsRepository,
  InklingImageRepository,
])
void main() {
  late MockInklingsRepository mockInklingsRepository;
  late MockInklingImageRepository mockInklingImageRepository;
  late ProviderContainer container;

  setUp(
    () {
      mockInklingsRepository = MockInklingsRepository();
      mockInklingImageRepository = MockInklingImageRepository();
      container = ProviderContainer(
        overrides: [
          inklingRepositoryProvider
              .overrideWith((ref) => mockInklingsRepository),
          inklingImageRepositoryProvider
              .overrideWith((ref) => mockInklingImageRepository),
        ],
      );
    },
  );

  tearDown(() => container.dispose());

  test('should start with initial state', () {
    final state = container.read(inklingFormNotifierProvider);

    expect(state.isEditing, equals(false));
    expect(state.isSaving, equals(false));
    expect(state.showErrorMessage, equals(false));
    expect(state.inkling.note, equals(''));
    expect(state.inkling.link, equals(''));
    expect(state.inkling.imagePath, equals(''));
    expect(state.inkling.memo, equals(''));
    expect(state.inkling.tags, equals(List<Tag>.empty()));
  });

  test('noteChanged should update the note', () {
    final notifier = container.read(inklingFormNotifierProvider.notifier);
    notifier.noteChanged(noteStr: 'new note');

    expect(
      container.read(inklingFormNotifierProvider).inkling.note,
      equals('new note'),
    );
  });

  test('should change memo when memoChanged is called', () {
    container
        .read(inklingFormNotifierProvider.notifier)
        .memoChanged(memoStr: 'New memo');

    final state = container.read(inklingFormNotifierProvider);

    expect(state.inkling.memo, equals('New memo'));
  });

  test('should change tags when tagsChanged is called', () {
    final newTags = [Tag(name: 'tag1', id: '1'), Tag(name: 'tag2', id: '2')];
    container
        .read(inklingFormNotifierProvider.notifier)
        .tagsChanged(tags: newTags);

    final state = container.read(inklingFormNotifierProvider);

    expect(state.inkling.tags, equals(newTags));
  });

  test('should change imagePath when imagePathChanged is called', () async {
    when(mockInklingImageRepository.pickImage(
            isCameraSource: anyNamed('isCameraSource')))
        .thenAnswer((_) async => 'new/path');

    await container
        .read(inklingFormNotifierProvider.notifier)
        .imagePathChanged(isCameraSource: true);

    final state = container.read(inklingFormNotifierProvider);

    expect(state.inkling.imagePath, equals('new/path'));
  });

  test('should clear imagePath when clearImagePath is called', () {
    container.read(inklingFormNotifierProvider.notifier).clearImagePath();

    final state = container.read(inklingFormNotifierProvider);

    expect(state.inkling.imagePath, equals(''));
  });

  test('should change link when linkChanged is called', () {
    container
        .read(inklingFormNotifierProvider.notifier)
        .linkChanged(linkStr: 'New link');

    final state = container.read(inklingFormNotifierProvider);

    expect(state.inkling.link, equals('New link'));
  });

  test('should update isSaving and showErrorMessage when saved is called',
      () async {
    when(mockInklingsRepository.upsert(any))
        .thenAnswer((_) async => right(unit)); // For successful case

    await container.read(inklingFormNotifierProvider.notifier).saved();

    var state = container.read(inklingFormNotifierProvider);

    expect(state.isSaving, equals(false));
    expect(state.showErrorMessage, equals(false));

    when(mockInklingsRepository.upsert(any)).thenAnswer((_) async =>
        left(const InklingFailure.unableToCreate())); // For error case

    await container.read(inklingFormNotifierProvider.notifier).saved();

    state = container.read(inklingFormNotifierProvider);

    expect(state.isSaving, equals(false));
    expect(state.showErrorMessage, equals(true));
  });
}
