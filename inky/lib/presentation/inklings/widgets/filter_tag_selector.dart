import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers.dart';
import '../../../styles/styles.dart';
import 'package:inky/domain/tags/tag.dart';
import 'widgets.dart';

class FilterTagRow extends ConsumerWidget {
  const FilterTagRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterTags =
        ref.watch(inklingFilterNotifier.select((state) => state.filter));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final tag in filterTags) _buildTagChipRemoveButton(ref, tag)
        ],
      ),
    );
  }

  Widget _buildTagChipRemoveButton(WidgetRef ref, Tag tag) {
    return GestureDetector(
      onTap: () =>
          ref.read(inklingFilterNotifier.notifier).removeFilterTag(tag),
      child: Padding(
        padding: EdgeInsets.only(
          right: $styles.insets.xs,
          bottom: $styles.insets.sm,
        ),
        child: TagChip(tag: tag, leadingAction: true),
      ),
    );
  }
}
