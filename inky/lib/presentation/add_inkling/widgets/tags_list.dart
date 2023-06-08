import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';
import '../../../styles/styles.dart';
import '../../presentation.dart';

class TagsList extends StatelessWidget {
  const TagsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        final tags = ref.watch(
            inklingFormNotifierProvider.select((state) => state.inkling.tags));
        return Wrap(
          spacing: $styles.insets.xxs,
          runSpacing: $styles.insets.xs,
          children: [
            ...tags
                .map((e) => TagChip(
                      tag: e,
                      isExpanded: true,
                    ))
                .toList(),
            const StyledAddTagButton(),
          ],
        );
      }),
    );
  }
}
