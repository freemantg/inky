import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../shared/styled_appbar_action.dart';
import '../../shared/styled_appbar_leading_back_button.dart';
import '../../shared/styled_appbar_title.dart';
import '../../tags/tags_page.dart';

class StyledModalBottomSheet extends StatelessWidget {
  const StyledModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              StyledAppbarLeadingBackButton(),
              StyledAppbarTitle(title: 'ADD TAG'),
              StyledAppbarAction(title: 'DONE'),
            ],
          ),
          HSpace(size: $styles.insets.sm),
          const TagFilterTextField(),
          //SizedBox with bottomPadding to allow TextField to scroll w/ Bottom Sheet
          HSpace(size: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
