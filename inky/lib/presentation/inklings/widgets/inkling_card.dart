import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../styles/styles.dart';
import 'widgets.dart';

class InklingCard extends StatelessWidget {
  const InklingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final greyIndex = math.Random().nextInt(4);

    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.grey[greyIndex],
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          const Expanded(child: Placeholder()),
          const HSpace(size: 6.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TagChip(
                  title: 'Apples',
                  isDense: true,
                  greyIndex: greyIndex + 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
