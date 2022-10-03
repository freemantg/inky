import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/providers.dart';

import '../../styles/styles.dart';

class StyledAppbarAction extends StatelessWidget {
  const StyledAppbarAction({
    super.key,
    required this.isManagingInklingTags,
  });

  final bool isManagingInklingTags;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ref.watch(tagsNotifierProvider).maybeMap(
              loadSuccess: (state) => TextButton(
                onPressed: () {
                  final filter = state.filter;
                  if (filter != null) {
                    isManagingInklingTags
                        ? ref
                            .read(inklingFormNotifierProvider.notifier)
                            .tagsChanged(tags: filter)
                        : ref
                            .read(inklingFilterNotifier.notifier)
                            .updateFilter(tags: filter);
                  }
                  context.pop();
                },
                child: Text(
                  'DONE',
                  style: $styles.text.h4.copyWith(
                    color: $styles.colors.grey05,
                    fontSize: 12.0,
                  ),
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
      },
    );
  }
}
