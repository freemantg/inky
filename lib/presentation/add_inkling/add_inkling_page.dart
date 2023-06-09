import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/inklings/inkling.dart';
import '../../providers.dart';
import '../../router.dart';
import '../../styles/styles.dart';
import '../shared/widgets.dart';
import 'widgets/widgets.dart';

class AddInklingPage extends HookConsumerWidget {
  const AddInklingPage({
    required this.inklingType,
    this.inkling,
    super.key,
  });

  final InklingType inklingType;
  final Inkling? inkling;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() => ref
          .read(inklingFormNotifierProvider.notifier)
          .initialized(inkling: inkling));
      return null;
    }, []);

    //Pops current stack if form state is not longer saving
    ref.listen(inklingFormNotifierProvider, (previous, next) {
      if (previous?.isSaving != next.isSaving) {
        context.go(ScreenPaths.home);
      }
    });

    final isEditing = ref
        .watch(inklingFormNotifierProvider.select((state) => state.isEditing));

    return Scaffold(
      appBar: AppBar(
        leading: const StyledAppBarLeadingBackButton(),
        centerTitle: true,
        title: StyledTitle(
          title: isEditing
              ? "EDIT ${inklingType.name.toUpperCase()}"
              : "ADD ${inklingType.name.toUpperCase()}",
        ),
        actions: [
          if (isEditing)
            IconButton(
              onPressed: () => ref
                  .read(inklingsNotifierProvider.notifier)
                  .deleteInkling(inkling!)
                  .then((_) => context.pop()),
              icon: const Icon(Icons.delete),
            )
        ],
      ),
      body: _buildScaffoldBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Main inkling input field
                _inklingTypeToWidget(inklingType),
                HSpace(size: $styles.insets.md),

                //Tag section
                const StyledSubtitle(title: 'Tags'),
                HSpace(size: $styles.insets.xs),
                const TagsList(),
                HSpace(size: $styles.insets.md),

                //Memo section
                Row(
                  children: [
                    const StyledSubtitle(title: 'Memo'),
                    const Spacer(),
                    Icon(Icons.edit, color: $styles.colors.grey04)
                  ],
                ),
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
      case InklingType.note:
        return const NoteTextFormField();
      case InklingType.image:
        return const InklingImage();
      case InklingType.link:
        return LinkTextField(inkling: inkling);
    }
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Consumer(builder: (context, ref, child) {
        return StyledElevatedButton(
          title: 'Ink It!',
          onPressed: () async =>
              await ref.read(inklingFormNotifierProvider.notifier).saved(),
        );
      }),
    );
  }
}
