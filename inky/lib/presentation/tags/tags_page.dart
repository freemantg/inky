import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/presentation/shared/widgets.dart';

import 'package:inky/providers.dart';
import 'package:inky/styles/styles.dart';

import '../../domain/tags/tag.dart';
import '../inklings/widgets/widgets.dart';
import 'tag_filter_text_field.dart';

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
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppbarLeadingBackButton(),
        title: const StyledAppbarTitle(title: 'SELECT TAGS'),
        actions: [
          StyledAppbarAction(
            isManagingInklingTags: widget.isManagingInklingTags,
          )
        ],
      ),
      body: _buildScaffoldBody(),
    );
  }
}

Widget _buildScaffoldBody() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
    child: Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TagFilterTextField(),
            HSpace(size: $styles.insets.xs),
            ref.watch(tagsNotifierProvider).maybeMap(
                  loadInProgress: (_) => const CircularProgressIndicator(),
                  loadSuccess: (state) {
                    final filter = state.filter;

                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (filter != null) FilterTagSelector(tags: filter),
                          Text('Tag List',
                              style: $styles.text.bodySmallBold
                                  .copyWith(color: $styles.colors.grey04)),
                          HSpace(size: $styles.insets.xs),
                          TagList(tags: state.tags)
                        ],
                      ),
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
          ],
        );
      },
    ),
  );
}

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.tags,
  });

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: tags.length,
            itemBuilder: (context, index) {
              final tag = tags[index];
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: $styles.insets.xs),
                  child: GestureDetector(
                    onTap: () => ref
                        .read(tagsNotifierProvider.notifier)
                        .addFilterTag(tag),
                    child: TagChip(tag: tag),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FilterTagSelector extends StatelessWidget {
  const FilterTagSelector({
    super.key,
    required this.tags,
  });

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: $styles.insets.sm),
          child: Wrap(
            spacing: $styles.insets.xxs,
            runSpacing: $styles.insets.xs,
            children: tags
                .map((tag) => GestureDetector(
                      onTap: () => ref
                          .read(tagsNotifierProvider.notifier)
                          .removeFilterTag(tag),
                      child: TagChip(
                        tag: tag,
                        leadingAction: true,
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
