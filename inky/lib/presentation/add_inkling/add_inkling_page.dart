import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/providers.dart';

import '../../domain/inklings/inkling.dart';
import '../../router.dart';
import '../../styles/styles.dart';
import '../shared/widgets.dart';
import 'widgets/widgets.dart';

class AddInklingPage extends ConsumerWidget {
  const AddInklingPage({
    required this.inklingType,
    this.inkling,
    super.key,
  });

  final InklingType inklingType;
  final Inkling? inkling;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializeInkling = inkling;

    if (initializeInkling != null) {
      ref
          .read(inklingFormNotifierProvider.notifier)
          .initialized(inkling: initializeInkling);
    }

    ref.listen(inklingFormNotifierProvider, (previous, next) {
      if (previous?.isSaving != next.isSaving) {
        context.go(ScreenPaths.home);
      }
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppbarLeadingBackButton(),
        title: ref.read(inklingFormNotifierProvider).isEditing
            ? StyledAppbarTitle(
                title: "EDIT ${inklingType.name.toUpperCase()}",
              )
            : StyledAppbarTitle(
                title: "ADD ${inklingType.name.toUpperCase()}",
              ),
      ),
      body: _buildScaffoldBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(ref),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _inklingTypeToWidget(inklingType),
                HSpace(size: $styles.insets.md),
                const StyledSubtitle(title: 'Tags'),
                HSpace(size: $styles.insets.xs),
                const StyledAddTagButton(),
                HSpace(size: $styles.insets.md),
                const StyledSubtitle(title: 'Memo'),
                HSpace(size: $styles.insets.xs),
                const MemoTextField(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _inklingTypeToWidget(InklingType type) {
    switch (type) {
      case InklingType.post:
        return const NoteTextFormField();
      case InklingType.image:
        return const InklingImage();
      case InklingType.link:
        return LinkTextField(inkling: inkling);
    }
  }

  Widget _buildBottomNavigationBar(WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: StyledElevatedButton(
        title: 'Ink It!',
        onPressed: () => ref.read(inklingFormNotifierProvider.notifier).saved(),
      ),
    );
  }
}
