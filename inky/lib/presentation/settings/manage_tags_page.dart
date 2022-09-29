import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/presentation/shared/widgets.dart';
import 'package:inky/providers.dart';

import '../../domain/tags/tag.dart';
import '../../styles/styles.dart';
import 'widgets/styled_modal_bottom_sheet.dart';

class ManageTagsPage extends ConsumerStatefulWidget {
  const ManageTagsPage({super.key});

  @override
  ConsumerState<ManageTagsPage> createState() => _ManageTagsPageState();
}

class _ManageTagsPageState extends ConsumerState<ManageTagsPage> {
  @override
  void initState() {
    super.initState();
    ref
        .read(tagsNotifierProvider.notifier)
        .registerService()
        .then((value) => ref.read(tagsNotifierProvider.notifier).fetchTags());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppbarLeadingBackButton(),
        title: const StyledAppbarTitle(title: 'MANAGE TAGS'),
        // actions: const [StyledAppbarAction(title: 'SAVE')],
      ),
      body: _buildScaffoldBody(ref),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildScaffoldBody(WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: ref.watch(tagsNotifierProvider).maybeMap(
              loadSuccess: (state) {
                return ListView.separated(
                  itemCount: state.tags.length,
                  separatorBuilder: (_, __) => StyledDivider(),
                  itemBuilder: (context, index) => _TagTile(state.tags[index]),
                );
              },
              loadInProgress: (_) =>
                  const CircularProgressIndicator(color: Colors.pink),
              orElse: () => const Text('Failure'),
            ));
  }
}

Padding _buildBottomNavigationBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all($styles.insets.sm),
    child: StyledElevatedButton(
      title: 'ADD TAG',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular($styles.corners.md),
            ),
          ),
          builder: ((context) => const StyledModalBottomSheet()),
        );
      },
    ),
  );
}

class _TagTile extends ConsumerWidget {
  const _TagTile(this.tag);

  final Tag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(tag.name, style: $styles.text.bodySmall),
      trailing: GestureDetector(
        onTap: () => ref.read(tagsNotifierProvider.notifier).deleteTag(tag),
        child: Icon(
          Icons.remove_circle,
          color: $styles.colors.accent1,
          size: 20.0,
        ),
      ),
    );
  }
}
