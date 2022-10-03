import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/presentation/shared/widgets.dart';
import 'package:inky/providers.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../router.dart';
import '../../styles/styles.dart';
import 'widgets/widgets.dart';

class InklingsPage extends ConsumerWidget {
  const InklingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      inklingFilterNotifier,
      (previous, next) {
        if (previous?.filter != next.filter ||
            previous?.typeFilter != next.typeFilter) {
          ref.read(inklingsNotifierProvider.notifier).fetchInklings(
                filter: next.filter,
                inklingType: next.typeFilter,
              );
        }
      },
    );

    final filter = ref.watch(inklingFilterNotifier).filter;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular($styles.corners.md))),
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: $styles.insets.sm,
                    horizontal: $styles.insets.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(child: StyledAppbarTitle(title: 'FILTER')),
                      HSpace(size: $styles.insets.md),
                      Row(
                        children: [
                          Text(
                            'Tags',
                            style: $styles.text.bodySmallBold.copyWith(
                              color: $styles.colors.grey03,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            iconSize: 18,
                            icon: const Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: () => context.push(
                              "${ScreenPaths.home}/${ScreenPaths.tags}",
                              extra: filter,
                            ),
                          )
                        ],
                      ),
                      HSpace(size: $styles.insets.sm),
                      const _FilterTagSelector(),
                      HSpace(size: $styles.insets.sm),
                      Text(
                        'Inkling',
                        style: $styles.text.bodySmallBold.copyWith(
                          color: $styles.colors.grey03,
                        ),
                      ),
                      HSpace(size: $styles.insets.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const InklingTypeButton(),
                          SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: $styles.colors.grey02,
                              thickness: 2,
                            ),
                          ),
                          ...InklingType.values.map(
                              (type) => InklingTypeButton(inklingType: type))
                        ],
                      ),
                      const Spacer(),
                      StyledElevatedButton(
                        title: 'Show Inklings',
                        onPressed: () {},
                      ),
                      HSpace(size: $styles.insets.md),
                    ],
                  ),
                );
              },
            ),
            icon: const Icon(Icons.filter_list_alt),
          ),
          IconButton(
            onPressed: () => context.go(
              "${ScreenPaths.home}/${ScreenPaths.settings}",
            ),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: _buildInklingCardGridView(),
      floatingActionButton: const StyledAnimatedFAB(),
    );
  }

  Widget _buildInklingCardGridView() {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _FilterTagSelector(),
                ref.watch(inklingsNotifierProvider).maybeMap(
                      loadInProgress: (_) => const CircularProgressIndicator(),
                      loadSuccess: (state) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: state.inklings.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: $styles.insets.xs,
                            crossAxisSpacing: $styles.insets.xs,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            final inkling = state.inklings[index];
                            return InklingCard(inkling: inkling);
                          },
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    )
              ],
            ),
          ),
        );
      },
    );
  }
}

class InklingTypeButton extends ConsumerWidget {
  const InklingTypeButton({
    super.key,
    this.inklingType,
  });

  final InklingType? inklingType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilterType = ref.watch(inklingFilterNotifier).typeFilter;

    return GestureDetector(
      onTap: () => ref
          .read(inklingFilterNotifier.notifier)
          .toggleInklingType(inklingType),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: selectedFilterType == inklingType
                ? $styles.colors.grey04
                : $styles.colors.grey01,
          ),
          VSpace(size: $styles.insets.xs),
          Text(
            toBeginningOfSentenceCase(inklingType?.name) ?? 'All',
            style: $styles.text.bodySmall.copyWith(
              color: $styles.colors.grey04,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}

class _FilterTagSelector extends StatelessWidget {
  const _FilterTagSelector();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ref
                .watch(inklingFilterNotifier)
                .filter
                .map((e) => GestureDetector(
                      onTap: () => ref
                          .read(inklingFilterNotifier.notifier)
                          .removeFilterTag(e),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: $styles.insets.xs,
                          bottom: $styles.insets.sm,
                        ),
                        child: TagChip(tag: e, leadingAction: true),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
