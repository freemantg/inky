import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

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
