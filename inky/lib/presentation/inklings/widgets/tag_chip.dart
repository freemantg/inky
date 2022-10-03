import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../domain/tags/tag.dart';
import '../../../styles/styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    Key? key,
    required this.tag,
    this.greyIndex,
    this.isDense = false,
    this.isExpanded = false,
    this.leadingAction = false,
  }) : super(key: key);

  final Tag tag;
  final bool isDense;
  final bool leadingAction;
  final bool isExpanded;
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: isExpanded ? 18.0 : null),
          Text(
            '#${tag.name}',
            style: $styles.text.caption.copyWith(
              color: isDense ? null : Colors.black,
              fontSize: isDense ? 10.0 : null,
            ),
          ),
          if (leadingAction)
            Padding(
              padding: EdgeInsets.only(left: $styles.insets.xxs),
              child: Icon(
                Icons.close,
                size: 14.0,
                color: $styles.colors.grey06,
              ),
            )
        ],
      ),
    );
  }
}
