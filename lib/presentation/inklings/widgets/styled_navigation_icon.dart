import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers.dart';
import '../../../router.dart';
import '../../../styles/styles.dart';

class StyledNavigationIcon extends ConsumerWidget {
  const StyledNavigationIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref
        .watch(inklingFilterNotifierProvider.select((state) => state.filter));

    void navigateToTags() {
      final path = "${ScreenPaths.home}${ScreenPaths.tags}";
      context.push(path, extra: filter);
    }

    return IconButton(
      color: $styles.colors.grey03,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: const Icon(Icons.arrow_forward_ios_rounded),
      onPressed: navigateToTags,
    );
  }
}
