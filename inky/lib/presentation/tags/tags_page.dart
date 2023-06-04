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
    Future.microtask(() => ref
        .read(tagsNotifierProvider.notifier)
        .initialiseTags(filter: initialTags));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppBarLeadingBackButton(),
        title: const StyledTitle(title: 'SELECT TAGS'),
        actions: [
          StyledAppBarAction(
            isManagingInklingTags: isManagingInklingTags,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TagFilterTextField(),
            SizedBox(height: $styles.insets.xs),
            TagsDisplay(tagsNotifierProvider: tagsNotifierProvider)
          ],
        ),
      ),
    );
  }
}

class TagsDisplay extends HookConsumerWidget {
  const TagsDisplay({Key? key, required this.tagsNotifierProvider})
      : super(key: key);
  final tagsNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagsState = ref.watch(tagsNotifierProvider);
    return tagsState.map(
      initial: (_) => const Text('Initial'),
      loadSuccess: (state) => TagListBuilder(state: state),
      loadInProgress: (_) => const CircularProgressIndicator(),
      loadFailure: (_) => const Text('Failed to load tags'),
    );
  }
}

class TagListBuilder extends StatelessWidget {
  const TagListBuilder({Key? key, required this.state}) : super(key: key);
  final LoadSuccess state;

  @override
  Widget build(BuildContext context) {
    final filter = state.filter;
    final tags = state.tags;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (filter != null) FilterTagSelector(tags: filter),
        const StyledMenuTitle(title: 'Tags List'),
        SizedBox(height: $styles.insets.xs),
        TagList(tags: tags),
      ],
    );
  }
}
