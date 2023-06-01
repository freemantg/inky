import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/application/application.dart';

import 'package:inky/providers.dart';
import 'package:inky/styles/styles.dart';

import '../../domain/tags/tag.dart';
import '../shared/widgets.dart';
import 'widgets/widgets.dart';

class TagsPage extends HookConsumerWidget {
  const TagsPage({
    Key? key,
    required this.initialTags,
    required this.isManagingInklingTags,
  }) : super(key: key);

  final List<Tag>? initialTags;
  final bool isManagingInklingTags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(ref),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: const StyledAppBarLeadingBackButton(),
      title: const StyledTitle(title: 'SELECT TAGS'),
      actions: [
        StyledAppBarAction(
          isManagingInklingTags: isManagingInklingTags,
        )
      ],
    );
  }

  Widget _buildBody(WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TagFilterTextField(),
          SizedBox(height: $styles.insets.xs),
          _buildTagsList(ref),
        ],
      ),
    );
  }

  Widget _buildTagsList(WidgetRef ref) {
    final tagsState = ref.watch(tagsNotifierProvider);

    return tagsState.map(
      initial: (_) => const Text('Initial'),
      loadSuccess: (state) => _buildTagList(state),
      loadInProgress: (_) => const CircularProgressIndicator(),
      loadFailure: (_) => const Text('Failed to load tags'),
    );
  }

  Widget _buildTagList(LoadSuccess state) {
    final filter = state.filter;
    final tags = state.tags;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (filter != null) FilterTagSelector(tags: filter),
          const StyledMenuTitle(title: 'Tags List'),
          SizedBox(height: $styles.insets.xs),
          Expanded(child: TagList(tags: tags)),
        ],
      ),
    );
  }
}
