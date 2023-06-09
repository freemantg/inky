import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../domain/tags/tag.dart';
import '../../../styles/styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    Key? key,
    required this.tag,
    this.onTap,
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
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final random = math.Random();
    final randomGreyIndex = greyIndex ?? random.nextInt(2);
    final tagColor = $styles.colors.grey[randomGreyIndex];

    Widget buildText() {
      return Text(
        '#${tag.name}',
        style: $styles.text.caption.copyWith(
          color: isDense ? null : Colors.black,
          fontSize: isDense ? 10.0 : null,
        ),
      );
    }

    Widget buildLeadingIcon() {
      return Padding(
        padding: EdgeInsets.only(left: $styles.insets.xxs),
        child: Icon(
          Icons.close,
          size: 14.0,
          color: $styles.colors.grey06,
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(right: 2.0),
      padding: EdgeInsets.symmetric(
        vertical: isDense ? 2.0 : $styles.insets.xxs,
        horizontal: isDense ? $styles.insets.xxs : $styles.insets.xs,
      ),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isExpanded) const SizedBox(height: 18.0),
            buildText(),
            if (leadingAction) buildLeadingIcon(),
          ],
        ),
      ),
    );
  }
}
