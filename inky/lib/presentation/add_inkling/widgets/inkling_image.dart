import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class InklingImage extends StatelessWidget {
  const InklingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: $styles.colors.grey02,
            ),
            child: Icon(
              Icons.close,
              color: $styles.colors.grey05,
              size: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
