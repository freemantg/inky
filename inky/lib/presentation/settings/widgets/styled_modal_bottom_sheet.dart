import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';
import '../../tags/tag_filter_text_field.dart';

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
          Stack(
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back_ios_new),
              ),
              Center(child: StyledAppbarTitle(title: 'ADD TAG')),
            ],
          ),
          HSpace(size: $styles.insets.md),
          const TagFilterTextField(),
          HSpace(size: $styles.insets.xl),
          //SizedBox with bottomPadding to allow TextField to scroll w/ Bottom Sheet
          HSpace(size: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
