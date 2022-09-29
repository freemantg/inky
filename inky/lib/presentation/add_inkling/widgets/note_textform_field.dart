import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/providers.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class NoteTextFormField extends ConsumerWidget {
  const NoteTextFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: TextFormField(
        onChanged: (noteStr) => ref
            .read(inklingFormNotifierProvider.notifier)
            .noteChanged(noteStr: noteStr),
        maxLines: null,
        expands: true,
        style: $styles.text.bodySmall,
        textAlignVertical: TextAlignVertical.top,
        decoration: StyledInputDecoration(hintText: 'Write your note...'),
      ),
    );
  }
}
