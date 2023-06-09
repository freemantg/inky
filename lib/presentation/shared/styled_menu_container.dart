import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class StyledMenuContainer extends StatelessWidget {
  const StyledMenuContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.bgGrey,
        borderRadius: BorderRadius.circular($styles.corners.md),
      ),
      margin: EdgeInsets.only(
        right: $styles.insets.sm,
        bottom: MediaQuery.of(context).size.height / 5,
      ),
      width: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.symmetric(
        vertical: $styles.insets.sm,
        horizontal: $styles.insets.xs,
      ),
      child: child,
    );
  }
}
