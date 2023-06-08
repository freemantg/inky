import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../providers.dart';
import '../../../router.dart';
import '../../../styles/styles.dart';

class InklingTypeButton extends ConsumerWidget {
  const InklingTypeButton({
    super.key,
    this.inklingType,
  });

  final InklingType? inklingType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilterType = ref.watch(
        inklingFilterNotifierProvider.select((state) => state.typeFilter));

    return GestureDetector(
      onTap: () => ref
          .read(inklingFilterNotifierProvider.notifier)
          .toggleInklingType(inklingType),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: selectedFilterType == inklingType
                ? $styles.colors.grey04
                : $styles.colors.grey01,
          ),
          VSpace(size: $styles.insets.xs),
          Text(
            toBeginningOfSentenceCase(inklingType?.name) ?? 'All',
            style: $styles.text.bodySmall.copyWith(
              color: $styles.colors.grey04,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
