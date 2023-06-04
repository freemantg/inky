import 'package:flutter/material.dart';
import 'package:inky/presentation/inklings/widgets/styled_navigation_icon.dart';

import '../../../router.dart';
import '../../../styles/styles.dart';
import '../../shared/widgets.dart';
import 'filter_tag_selector.dart';
import 'inkling_type_button.dart';
import 'styled_vertical_divider.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: $styles.insets.sm,
        horizontal: $styles.insets.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: StyledTitle(title: 'FILTER')),
          HSpace(size: $styles.insets.md),

          //Tag Selector
          const Row(
            children: [
              StyledMenuTitle(title: 'Tags'),
              Spacer(),
              StyledNavigationIcon(),
            ],
          ),
          HSpace(size: $styles.insets.sm),
          const FilterTagRow(),
          HSpace(size: $styles.insets.sm),

          //Inkling Type Selector
          const StyledMenuTitle(title: 'Inkling'),
          HSpace(size: $styles.insets.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const InklingTypeButton(),
              const StyledVerticalDivider(),
              ...InklingType.values.map(
                (type) => InklingTypeButton(inklingType: type),
              )
            ],
          ),
          const Spacer(),

          //Navigator used to pop the dialog only
          StyledElevatedButton(
            title: 'Show Inklings',
            onPressed: () => Navigator.of(context).pop(),
          ),
          HSpace(size: $styles.insets.md),
        ],
      ),
    );
  }
}
