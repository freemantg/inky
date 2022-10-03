import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/providers.dart';
import 'package:inky/router.dart';

import '../../../styles/styles.dart';

class StyledAddTagButton extends ConsumerWidget {
  const StyledAddTagButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formTags = ref.watch(inklingFormNotifierProvider).inkling.tags;

    return GestureDetector(
      onTap: () => context.push(
        '${ScreenPaths.home}${ScreenPaths.addInkling(InklingType.note)}/${ScreenPaths.tags}',
        extra: formTags,
      ),
      child: Container(
        padding: EdgeInsets.all($styles.insets.xxs),
        decoration: BoxDecoration(
          color: $styles.colors.grey04,
          borderRadius: BorderRadius.circular($styles.corners.sm),
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).backgroundColor,
          size: 18.0,
        ),
      ),
    );
  }
}
