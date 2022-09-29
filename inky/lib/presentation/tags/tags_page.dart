import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/presentation/shared/widgets.dart';

import 'package:inky/providers.dart';
import 'package:inky/styles/styles.dart';

import '../inklings/widgets/widgets.dart';
import 'tag_filter_text_field.dart';

class TagsPage extends ConsumerStatefulWidget {
  const TagsPage({super.key});

  @override
  ConsumerState<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends ConsumerState<TagsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(tagsNotifierProvider.notifier).registerService().then(
          (_) => ref.read(tagsNotifierProvider.notifier).fetchTags(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppbarLeadingBackButton(),
        title: const StyledAppbarTitle(title: 'SELECT TAGS'),
        actions: const [StyledAppbarAction(title: 'DONE')],
      ),
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TagFilterTextField(),
          HSpace(size: $styles.insets.lg),
          Text('Tag List',
              style: $styles.text.bodySmallBold.copyWith(
                color: $styles.colors.grey04,
              )),
          HSpace(size: $styles.insets.xs),
          ref.watch(tagsNotifierProvider).maybeMap(
                initial: (_) => const Text('Load Initial'),
                loadFailure: (_) => const Text('Load Failure'),
                loadInProgress: (_) => const CircularProgressIndicator(),
                loadSuccess: (state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.tags.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final tag = state.tags[index];
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: $styles.insets.xs),
                            child: TagChip(title: tag.name),
                          ),
                        );
                      },
                    ),
                  );
                },
                orElse: () => const Text('Or Else'),
              ),
        ],
      ),
    );
  }
}
