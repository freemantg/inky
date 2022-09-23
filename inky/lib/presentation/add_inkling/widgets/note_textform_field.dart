import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class NoteTextFormField extends StatelessWidget {
  const NoteTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLines: null,
        expands: true,
        style: $styles.text.bodySmall,
        textAlignVertical: TextAlignVertical.top,
        decoration: StyledInputDecoration(hintText: 'Write your note...'),
      ),
    );
  }
}
