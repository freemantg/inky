import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/tags/tag.dart';
import '../../../providers.dart';
import '../../../styles/styles.dart';
import '../../inklings/widgets/widgets.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.tags,
  });

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tags.length,
      itemBuilder: (context, index) {
        final tag = tags[index];
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: $styles.insets.xs),
            child: Consumer(builder: (context, ref, child) {
              return TagChip(
                tag: tag,
                onTap: () =>
                    ref.read(tagsNotifierProvider.notifier).addFilterTag(tag),
              );
            }),
          ),
        );
      },
    );
  }
}
