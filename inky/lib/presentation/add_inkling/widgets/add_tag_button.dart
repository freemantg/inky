import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/domain.dart';
import '../../../providers.dart';
import '../../../router.dart';
import '../../../styles/styles.dart';

class StyledAddTagButton extends ConsumerWidget {
  const StyledAddTagButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formTags = ref.watch(
        inklingFormNotifierProvider.select((state) => state.inkling.tags));

    return GestureDetector(
      onTap: () => _navigateToAddTagsScreen(context, formTags),
      child: Container(
        padding: EdgeInsets.all($styles.insets.xxs),
        decoration: BoxDecoration(
          color: $styles.colors.grey04,
          borderRadius: BorderRadius.circular($styles.corners.sm),
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.background,
          size: 18.0,
        ),
      ),
    );
  }

  void _navigateToAddTagsScreen(BuildContext context, List<Tag> tags) {
    final screenPath =
        '${ScreenPaths.home}${ScreenPaths.addInkling(InklingType.note)}/${ScreenPaths.tags}';
    context.push(screenPath, extra: tags);
  }
}
