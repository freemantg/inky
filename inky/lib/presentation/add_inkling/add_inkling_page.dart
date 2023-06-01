import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/presentation/presentation.dart';
import 'package:inky/providers.dart';

import '../../domain/inklings/inkling.dart';
import '../../router.dart';
import '../../styles/styles.dart';

class AddInklingPage extends ConsumerStatefulWidget {
  const AddInklingPage({
    required this.inklingType,
    this.inkling,
    super.key,
  });

  final InklingType inklingType;
  final Inkling? inkling;

  @override
  ConsumerState<AddInklingPage> createState() => _AddInklingPageState();
}

class _AddInklingPageState extends ConsumerState<AddInklingPage> {
  @override
  void initState() {
    super.initState();

    ///Initialises existing Inkling
    ref
        .read(inklingFormNotifierProvider.notifier)
        .initialized(inkling: widget.inkling);
  }

  @override
  Widget build(BuildContext context) {
    //Pops current stack if form state is not longer saving
    ref.listen(inklingFormNotifierProvider, (previous, next) {
      if (previous?.isSaving != next.isSaving) {
        context.go(ScreenPaths.home);
      }
    });

    final isEditing = ref.watch(inklingFormNotifierProvider).isEditing;

    return Scaffold(
      appBar: AppBar(
        leading: const StyledAppBarLeadingBackButton(),
        centerTitle: true,
        title: StyledTitle(
          title: isEditing
              ? "EDIT ${widget.inklingType.name.toUpperCase()}"
              : "ADD ${widget.inklingType.name.toUpperCase()}",
        ),
        actions: [
          if (isEditing)
            IconButton(
              onPressed: () => ref
                  .read(inklingsNotifierProvider.notifier)
                  .deleteInkling(widget.inkling!)
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
                _inklingTypeToWidget(widget.inklingType),
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
        return LinkTextField(inkling: widget.inkling);
    }
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Consumer(builder: (context, ref, child) {
        return StyledElevatedButton(
          title: 'Ink It!',
          onPressed: () =>
              ref.read(inklingFormNotifierProvider.notifier).saved(),
        );
      }),
    );
  }
}
