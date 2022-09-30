import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class StyledSubtitle extends StatelessWidget {
  const StyledSubtitle({
    super.key,
    required this.title,
    this.size,
  });

  final String title;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.bodySmall.copyWith(
        color: $styles.colors.grey04,
        fontSize: size,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
