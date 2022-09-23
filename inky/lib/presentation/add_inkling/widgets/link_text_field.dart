import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class LinkTextField extends StatelessWidget {
  const LinkTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: $styles.text.bodySmall,
      decoration: StyledInputDecoration(
        suffixIcon: const _AddLinkButton(),
        isDense: true,
      ),
    );
  }
}

class _AddLinkButton extends StatelessWidget {
  const _AddLinkButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all($styles.insets.xs),
      decoration: BoxDecoration(
        color: $styles.colors.grey04,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular($styles.corners.sm),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}
