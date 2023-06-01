import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inky/domain/tags/tag_failure.dart';
import 'package:inky/infrastructure/tags/tags_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/tags/tag.dart';

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
  StreamSubscription<Either<TagFailure, List<Tag>>>? _tagStreamSubscription;

  TagsNotifier({required TagRepository tagRepository})
      : _tagRepository = tagRepository,
        super(const TagsState.initial()) {
    _tagStreamSubscription = _tagRepository.streamTags([]).listen(
      (failureOrTags) {
        failureOrTags.fold(
          (failure) => state = TagsState.loadFailure(failure),
          (tags) => state = TagsState.loadSuccess(tags),
        );
      },
    );
  }

  // void fetchTags({List<Tag>? filter}) async {
  //   // state = const TagsState.loadInProgress();
  //   final successOrFailure = await _tagRepository.fetchTags(
  //       filter: (tag) => filter?.contains(tag) ?? false);
  //   successOrFailure.fold(
  //     (failure) => state = TagsState.loadFailure(failure),
  //     (tags) => state = TagsState.loadSuccess(tags, filter: filter),
  //   );
  // }

  Future<void> createTag(String name) async {
    await _tagRepository.create(Tag(
      id: const Uuid().v4(),
      name: name,
    ));
    // fetchTags(filter: state.filter);
  }

  Future<void> deleteTag(Tag tag) async {
    await _tagRepository.delete(tag);
    // fetchTags();
  }

  void addFilterTag(Tag tag) {
    final newFilterTags = List<Tag>.from(state.filter ?? []);
    newFilterTags.add(tag);
    state = state.copyWith(filter: newFilterTags);
    // fetchTags(filter: newFilterTags);
  }

  void removeFilterTag(Tag tag) {
    final newFilterTags = List<Tag>.from(state.filter ?? []);
    newFilterTags.remove(tag);
    state = state.copyWith(filter: newFilterTags);
    // fetchTags(filter: newFilterTags);
  }

  @override
  void dispose() {
    _tagStreamSubscription?.cancel();
    super.dispose();
  }
}
