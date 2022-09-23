import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class StyledAppbarAction extends StatelessWidget {
  const StyledAppbarAction({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: $styles.text.h4.copyWith(
          color: $styles.colors.grey04,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
