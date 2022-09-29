import 'package:flutter/material.dart';
import 'package:inky/styles/styles.dart';

class StyledDivider extends Divider {
  StyledDivider({
    super.key,
  }) : super(
          color: $styles.colors.grey02,
          height: 3.0,
        );
}
