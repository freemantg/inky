import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/providers.dart';

import '../../router.dart';
import '../../styles/styles.dart';
import 'widgets/widgets.dart';

class InklingsPage extends ConsumerStatefulWidget {
  const InklingsPage({super.key});

  @override
  ConsumerState<InklingsPage> createState() => _InklingsPageState();
}

class _InklingsPageState extends ConsumerState<InklingsPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(inklingsNotifierProvider.notifier);
    notifier.registerService().then((_) => notifier.fetchInklings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.go(ScreenPaths.tags),
            icon: const Icon(Icons.filter_list_alt),
          ),
          IconButton(
            onPressed: () => context.go(ScreenPaths.settings),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: _buildInklingCardGridView(),
      floatingActionButton: const StyledAnimatedFAB(),
    );
  }

  Widget _buildInklingCardGridView() {
    return ref.watch(inklingsNotifierProvider).maybeMap(
          loadInProgress: (_) => const CircularProgressIndicator(),
          loadSuccess: (state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
              child: GridView.builder(
                itemCount: state.inklings.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: $styles.insets.xs,
                  crossAxisSpacing: $styles.insets.xs,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final inkling = state.inklings[index];
                  return InklingCard(inkling: inkling);
                },
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
  }
}
