import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class StyledElevatedButton extends StatelessWidget {
  const StyledElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 0),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: Text(
          title,
          style: $styles.text.h4.copyWith(
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
    );
  }
}
