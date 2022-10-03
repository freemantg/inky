import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:inky/providers.dart';
import 'package:inky/styles/styles.dart';

import '../../domain/tags/tag.dart';
import '../shared/widgets.dart';
import 'widgets/widgets.dart';


class TagsPage extends ConsumerStatefulWidget {
  const TagsPage({
    super.key,
    this.initialTags,
    required this.isManagingInklingTags,
  });

  final List<Tag>? initialTags;
  final bool isManagingInklingTags;

  @override
  ConsumerState<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends ConsumerState<TagsPage> {
  @override
  void initState() {
    super.initState();
    //Initialises Filter Tags
    ref
        .read(tagsNotifierProvider.notifier)
        .fetchTags(filter: widget.initialTags);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildScaffoldAppBar(),
      body: _buildScaffoldBody(),
    );
  }

  AppBar _buildScaffoldAppBar() {
    return AppBar(
      centerTitle: true,
      leading: const StyledAppbarLeadingBackButton(),
      title: const StyledTitle(title: 'SELECT TAGS'),
      actions: [
        StyledAppbarAction(
          isManagingInklingTags: widget.isManagingInklingTags,
        )
      ],
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TagFilterTextField(),
          HSpace(size: $styles.insets.xs),
          ref.watch(tagsNotifierProvider).maybeMap(
                loadSuccess: (state) {
                  final filter = state.filter;

                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (filter != null) FilterTagSelector(tags: filter),
                        const StyledMenuTitle(title: 'Tags List'),
                        HSpace(size: $styles.insets.xs),
                        TagList(tags: state.tags)
                      ],
                    ),
                  );
                },
                loadInProgress: (_) => const CircularProgressIndicator(),
                orElse: () => const SizedBox.shrink(),
              ),
        ],
      ),
    );
  }
}
