import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/router.dart';
import 'package:inky/styles/styles.dart';

import 'widgets/inkling_card.dart';
import 'widgets/styled_animated_fab.dart';

class InklingsPage extends StatelessWidget {
  const InklingsPage({super.key});

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
      floatingActionButton: const StyledAnimatedFAB(),
      body: _buildInklingCardGridView(),
    );
  }

  Widget _buildInklingCardGridView() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: $styles.insets.xs,
        mainAxisSpacing: $styles.insets.xs,
        children: const [
          InklingCard(),
          InklingCard(),
          InklingCard(),
          InklingCard(),
        ],
      ),
    );
  }
}
