import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/tags/tag.dart';
import '../../../providers.dart';
import '../../../styles/styles.dart';
import '../../inklings/widgets/widgets.dart';

class FilterTagSelector extends StatelessWidget {
  const FilterTagSelector({
    super.key,
    required this.tags,
  });

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: $styles.insets.sm),
      child: Consumer(
        builder: (context, ref, child) => Wrap(
          spacing: $styles.insets.xxs,
          runSpacing: $styles.insets.xs,
          children: tags
              .map((tag) => TagChip(
                    tag: tag,
                    leadingAction: true,
                    onTap: () => ref
                        .read(tagsNotifierProvider.notifier)
                        .removeFilterTag(tag),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
