import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/providers.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class MemoTextField extends ConsumerWidget {
  const MemoTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
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
