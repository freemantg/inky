import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';

part 'tags_notifier.freezed.dart';

@freezed
class TagsState with _$TagsState {
  const factory TagsState.initial({List<Tag>? filter}) = Initial;
  const factory TagsState.loadInProgress({List<Tag>? filter}) = LoadInProgress;
  const factory TagsState.loadSuccess(List<Tag> tags, {List<Tag>? filter}) =
      LoadSuccess;
  const factory TagsState.loadFailure(TagFailure failure, {List<Tag>? filter}) =
      Failure;
}

class TagsNotifier extends StateNotifier<TagsState> {
  final TagRepository _tagRepository;

  TagsNotifier({
    required TagRepository tagRepository,
  })  : _tagRepository = tagRepository,
        super(const TagsState.initial()) {
    streamTags();
  }

  void initialiseTags({List<Tag>? filter}) {
    state = state.copyWith(filter: filter);
    streamTags();
  }

  void streamTags() {
    state = TagsState.loadInProgress(filter: state.filter);
    final successOrFailure = _tagRepository.streamTags(state.filter);
    successOrFailure.listen(
      (event) {
        event.fold(
          (failure) =>
              state = TagsState.loadFailure(failure, filter: state.filter),
          (tags) => state = TagsState.loadSuccess(tags, filter: state.filter),
        );
      },
    );
  }

  Future<void> createTag(String name) async {
    await _tagRepository.create(
      Tag(
        id: const Uuid().v4(),
        name: name,
      ),
    );
  }

  Future<void> deleteTag(Tag tag) async {
    await _tagRepository.delete(tag);
  }

  void addFilterTag(Tag tag) {
    final newFilterTags = List<Tag>.from(state.filter ?? []);
    newFilterTags.add(tag);
    state = state.copyWith(filter: newFilterTags);
    streamTags();
  }

  void removeFilterTag(Tag tag) {
    final newFilterTags = List<Tag>.from(state.filter ?? []);
    newFilterTags.remove(tag);
    state = state.copyWith(filter: newFilterTags);
    streamTags();
  }
}
