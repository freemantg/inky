import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../styles/styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    Key? key,
    required this.title,
    this.isDense = false,
    this.greyIndex,
  }) : super(key: key);

  final String title;
  final bool isDense;
  final int? greyIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2.0),
      padding: EdgeInsets.symmetric(
        vertical: isDense ? 2.0 : $styles.insets.xxs,
        horizontal: isDense ? $styles.insets.xxs : $styles.insets.xs,
      ),
      decoration: BoxDecoration(
        color: $styles.colors.grey[greyIndex ?? math.Random().nextInt(2)],
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Text(
        '#$title',
        style: $styles.text.caption.copyWith(
          color: isDense ? null : Colors.black,
          fontSize: isDense ? 10.0 : null,
        ),
      ),
    );
  }
}
