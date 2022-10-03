import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';
import '../../../styles/styles.dart';
import '../../inklings/widgets/widgets.dart';
import 'widgets.dart';

class TagsList extends StatelessWidget {
  const TagsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        return Wrap(
          spacing: $styles.insets.xxs,
          runSpacing: $styles.insets.xs,
          children: [
            ...ref
                .watch(inklingFormNotifierProvider)
                .inkling
                .tags
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