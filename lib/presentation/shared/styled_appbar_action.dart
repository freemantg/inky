import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/application.dart';
import '../../providers.dart';
import '../../styles/styles.dart';

class StyledAppBarAction extends StatelessWidget {
  const StyledAppBarAction({
    Key? key,
    required this.isManagingInklingTags,
  }) : super(key: key);

  final bool isManagingInklingTags;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final filterState = ref.watch(tagsNotifierProvider);
        if (filterState is LoadSuccess) {
          final filter = filterState.filter;
          if (filter != null) {
            final inklingFormNotifier =
                ref.read(inklingFormNotifierProvider.notifier);
            final inklingFilterNotifier =
                ref.read(inklingFilterNotifierProvider.notifier);

            return TextButton(
              onPressed: () {
                if (isManagingInklingTags) {
                  inklingFormNotifier.tagsChanged(tags: filter);
                } else {
                  inklingFilterNotifier.updateFilter(tags: filter);
                }
                Navigator.pop(context);
              },
              child: Text(
                'DONE',
                style: $styles.text.h4.copyWith(
                  color: $styles.colors.grey05,
                  fontSize: 12.0,
                ),
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
