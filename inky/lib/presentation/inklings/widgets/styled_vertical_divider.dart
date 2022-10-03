import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class StyledVerticalDivider extends StatelessWidget {
  const StyledVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: VerticalDivider(
        color: $styles.colors.grey02,
        thickness: 2,
      ),
    );
  }
}
