import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class StyledAddTagButton extends StatelessWidget {
  const StyledAddTagButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($styles.insets.xxs),
      decoration: BoxDecoration(
        color: $styles.colors.grey04,
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).backgroundColor,
        size: 18.0,
      ),
    );
  }
}
