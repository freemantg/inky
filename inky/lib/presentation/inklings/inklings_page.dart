import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';
import '../../styles/styles.dart';
import 'widgets/widgets.dart';

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
      body: _buildInklingCardGridView(),
      floatingActionButton: const StyledAnimatedFAB(),
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
