import 'package:flutter/material.dart';
import 'package:inky/presentation/shared/text_field_input_decoration.dart';

import '../../../styles/styles.dart';

class MemoTextField extends StatelessWidget {
  const MemoTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      maxLength: 150,
      style: $styles.text.bodySmall,
      decoration: StyledInputDecoration(hintText: 'What inspired the inkling?'),
    );
  }
}
