import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import 'styled_titles.dart';

class MenuAction extends StatelessWidget {
  const MenuAction({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.xxs),
      child: GestureDetector(
        onTap: () {
          //Pops dialog menu
          Navigator.pop(context, true);
          onTap();
        },
        child: Row(
          children: [
            Icon(iconData, color: $styles.colors.grey04),
            const VSpace(size: 14.0),
            StyledBodyTitle(title: title),
          ],
        ),
      ),
    );
  }
}
