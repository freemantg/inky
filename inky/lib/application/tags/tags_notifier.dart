import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/tags/tags_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/tags/tag.dart';

part 'tags_notifier.freezed.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState.initial() = _Initial;
  const factory TagsState.loadInProgress() = _LoadInProgress;
  const factory TagsState.loadSuccess(List<Tag> tags) = _LoadSuccess;
  const factory TagsState.loadFailure(InklingFailure failure) = _Failure;
}

class TagsNotifier extends StateNotifier<TagsState> {
  final TagRepository _tagRepository;

  TagsNotifier({required TagRepository tagRepository})
      : _tagRepository = tagRepository,
        super(const TagsState.initial());

  Future<void> registerService() async =>
      await _tagRepository.registerService();

  Future<void> fetchTags() async {
    state = const TagsState.loadInProgress();
    final successOrFailure = await _tagRepository.fetchTags();
    successOrFailure.fold(
      (failure) => state = TagsState.loadFailure(failure),
      (tags) => state = TagsState.loadSuccess(tags),
    );
  }

  Future<void> addTag(String name) async {
    await _tagRepository.create(Tag(name: name));
    await fetchTags();
  }

  Future<void> deleteTag(Tag tag) async {
    await _tagRepository.delete(tag);
    await fetchTags();
  }
}
