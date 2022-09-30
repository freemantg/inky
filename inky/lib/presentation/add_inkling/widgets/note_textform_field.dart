import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/providers.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class NoteTextFormField extends HookConsumerWidget {
  const NoteTextFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    
    if (ref.read(inklingFormNotifierProvider).isEditing) {
      textEditingController.text =
          ref.read(inklingFormNotifierProvider).inkling.note;
    }

    return Expanded(
      child: TextFormField(
        controller: textEditingController,
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
