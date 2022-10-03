import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/presentation/shared/widgets.dart';
import 'package:inky/providers.dart';

import '../../domain/tags/tag.dart';
import '../../styles/styles.dart';
import 'widgets/styled_modal_bottom_sheet.dart';

class ManageTagsPage extends StatelessWidget {
  const ManageTagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppbarLeadingBackButton(),
        title: const StyledAppbarTitle(title: 'MANAGE TAGS'),
      ),
      body: _buildScaffoldBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: Consumer(
        builder: (context, ref, child) {
          final tagState = ref.watch(tagsNotifierProvider);

          return tagState.maybeMap(
            loadSuccess: (state) {
              return ListView.separated(
                itemCount: state.tags.length,
                separatorBuilder: (_, __) => StyledDivider(),
                itemBuilder: (context, index) {
                  final tag = state.tags[index];
                  return _TagTile(
                    tag: state.tags[index],
                    onTap: () =>
                        ref.read(tagsNotifierProvider.notifier).deleteTag(tag),
                  );
                },
              );
            },
            loadInProgress: (_) => const CircularProgressIndicator(),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
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

class _TagTile extends StatelessWidget {
  const _TagTile({
    required this.tag,
    required this.onTap,
  });

  final Tag tag;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(tag.name, style: $styles.text.bodySmall),
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.remove_circle,
          color: $styles.colors.accent1,
          size: 20.0,
        ),
      ),
    );
  }
}
