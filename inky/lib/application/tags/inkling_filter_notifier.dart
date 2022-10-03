import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/tags/tag.dart';
import '../../router.dart';

part 'inkling_filter_notifier.freezed.dart';

@freezed
class InklingFilterState with _$InklingFilterState {
  const factory InklingFilterState({
    required List<Tag> filter,
    InklingType? typeFilter,
  }) = _InklingFilterState;

  factory InklingFilterState.initial() => const InklingFilterState(filter: []);
}

class InklingFilterNotifier extends StateNotifier<InklingFilterState> {
  InklingFilterNotifier() : super(InklingFilterState.initial());

  void updateFilter({List<Tag>? tags}) {
    if (tags == null) return;
    state = state.copyWith(filter: tags);
  }

  void removeFilterTag(Tag tag) {
    final newTags = List<Tag>.from(state.filter);
    newTags.remove(tag);
    state = state.copyWith(filter: newTags);
  }

  void toggleInklingType(InklingType? type) =>
      state = state.copyWith(typeFilter: type);
}
