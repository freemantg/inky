import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/providers.dart';

import '../../router.dart';
import '../../styles/styles.dart';
import 'widgets/widgets.dart';

class InklingsPage extends HookWidget {
  const InklingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: _buildAppBarActions(context)),
      body: _buildScaffoldBody(),
      floatingActionButton: const StyledAnimatedFAB(),
    );
  }

  List<IconButton> _buildAppBarActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.filter_list_alt),
          onPressed: () => _showFilterModalBottomSheet(context),
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () =>
              context.go("${ScreenPaths.home}${ScreenPaths.settings}"),
        )
      ];

  Future<void> _showFilterModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular($styles.corners.md),
        ),
      ),
      builder: (context) => const FilterMenu(),
    );
  }
}

Widget _buildScaffoldBody() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
    child: SingleChildScrollView(
      child: Consumer(
        builder: (context, ref, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterTagRow(),
              ref.watch(inklingsNotifierProvider).maybeMap(
                    initial: (value) => const Text('Initial'),
                    loadInProgress: (_) => const CircularProgressIndicator(),
                    loadSuccess: (state) =>
                        InklingGridBuilder(inklings: state.inklings),
                    orElse: () => const Text('Load Failure'),
                  ),
            ],
          );
        },
      ),
    ),
  );
}
