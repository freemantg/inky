import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class StyledAppbarTitle extends StatelessWidget {
  const StyledAppbarTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.h4.copyWith(
        color: $styles.colors.grey05,
      ),
    );
  }
}
