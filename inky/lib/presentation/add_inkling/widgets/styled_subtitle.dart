import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class StyledSubtitle extends StatelessWidget {
  const StyledSubtitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.bodySmall.copyWith(
        color: $styles.colors.grey04,
      ),
    );
  }
}
