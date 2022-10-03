import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/tags/tags_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/tags/tag.dart';

part 'tags_notifier.freezed.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState.initial({List<Tag>? filter}) = _Initial;
  const factory TagsState.loadInProgress({List<Tag>? filter}) = _LoadInProgress;
  const factory TagsState.loadSuccess(List<Tag> tags, {List<Tag>? filter}) =
      _LoadSuccess;
  const factory TagsState.loadFailure(InklingFailure failure,
      {List<Tag>? filter}) = _Failure;
}

class TagsNotifier extends StateNotifier<TagsState> {
  final TagRepository _tagRepository;

  TagsNotifier({required TagRepository tagRepository})
      : _tagRepository = tagRepository,
        super(const TagsState.initial());

  //OPENS TAG HIVE BOX
  Future<void> registerService() async {
    await _tagRepository
        .registerService()
        .then((_) => fetchTags(filter: state.filter));
  }

  void fetchTags({List<Tag>? filter}) {
    state = const TagsState.loadInProgress();
    final successOrFailure = _tagRepository.fetchTags(filter: filter);
    successOrFailure.fold(
      (failure) => state = TagsState.loadFailure(failure),
      (tags) => state = TagsState.loadSuccess(tags, filter: filter),
    );
  }

  Future<void> createTag(String name) async {
    await _tagRepository.create(Tag(name: name));
    fetchTags(filter: state.filter);
  }

  Future<void> deleteTag(Tag tag) async {
    await _tagRepository.delete(tag);
    fetchTags();
  }

  void addFilterTag(Tag tag) {
    final newFilterTags = List<Tag>.from(state.filter ?? []);
    newFilterTags.add(tag);
    state = state.copyWith(filter: newFilterTags);
    fetchTags(filter: newFilterTags);
  }

  void removeFilterTag(Tag tag) {
    final newFilterTags = List<Tag>.from(state.filter ?? []);
    newFilterTags.remove(tag);
    state = state.copyWith(filter: newFilterTags);
    fetchTags(filter: newFilterTags);
  }
}
