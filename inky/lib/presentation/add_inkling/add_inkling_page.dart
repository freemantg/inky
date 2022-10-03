import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/providers.dart';

import '../../domain/inklings/inkling.dart';
import '../../router.dart';
import '../../styles/styles.dart';
import '../shared/widgets.dart';
import 'widgets/tags_list.dart';
import 'widgets/widgets.dart';

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

    ///INITIALIZES INKING
    ref
        .read(inklingFormNotifierProvider.notifier)
        .initialized(inkling: widget.inkling);
  }

  @override
  Widget build(BuildContext context) {
    //POPS CURRENT STACK IF NO LONGER SAVING & FETCHES UPDATED INKLING LIST
    ref.listen(inklingFormNotifierProvider, (previous, next) {
      if (previous?.isSaving != next.isSaving) {
        context.go(ScreenPaths.home);
        ref.read(inklingsNotifierProvider.notifier).fetchInklings();
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: const StyledAppbarLeadingBackButton(),
        centerTitle: true,
        title: StyledAppbarTitle(
          title: ref.read(inklingFormNotifierProvider).isEditing
              ? "EDIT ${widget.inklingType.name.toUpperCase()}"
              : "ADD ${widget.inklingType.name.toUpperCase()}",
        ),
        actions: [
          if (ref.read(inklingFormNotifierProvider).isEditing)
            IconButton(
              onPressed: () => ref
                  .read(inklingsNotifierProvider.notifier)
                  .deleteInkling(widget.inkling!),
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
                //MAIN INKING INPUT
                _inklingTypeToWidget(widget.inklingType),
                HSpace(size: $styles.insets.md),

                //TAGS SECTION
                const StyledSubtitle(title: 'Tags'),
                HSpace(size: $styles.insets.xs),
                const TagsList(),
                HSpace(size: $styles.insets.md),

                //MEMO SECTION
                Row(
                  children: [
                    const StyledSubtitle(title: 'Memo'),
                    const Spacer(),
                    Icon(
                      Icons.edit,
                      color: $styles.colors.grey04,
                    )
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
