import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/providers.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class MemoTextField extends HookConsumerWidget {
  const MemoTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();

    if (ref.read(inklingFormNotifierProvider).isEditing) {
      textEditingController.text =
          ref.read(inklingFormNotifierProvider).inkling.memo;
    }

    return TextField(
      controller: textEditingController,
      onChanged: (memoStr) => ref
          .read(inklingFormNotifierProvider.notifier)
          .memoChanged(memoStr: memoStr),
      maxLines: 3,
      maxLength: 150,
      style: $styles.text.bodySmall,
      decoration: StyledInputDecoration(hintText: 'What inspired the inkling?'),
    );
  }
}
