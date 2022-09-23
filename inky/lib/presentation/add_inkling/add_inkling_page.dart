import 'package:flutter/material.dart';
import 'package:inky/presentation/add_inkling/widgets/link_text_field.dart';
import 'package:inky/presentation/shared/styled_appbar_leading_back_button.dart';
import 'package:inky/presentation/shared/styled_appbar_title.dart';

import '../../router.dart';
import '../../styles/styles.dart';
import '../shared/styled_elevated_button.dart';
import 'widgets/add_tag_button.dart';
import 'widgets/inkling_image.dart';
import 'widgets/memo_text_field.dart';
import 'widgets/note_textform_field.dart';
import 'widgets/styled_subtitle.dart';

class AddInklingPage extends StatelessWidget {
  const AddInklingPage(this.inklingType, {super.key});

  final InklingType inklingType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const StyledAppbarLeadingBackButton(),
        title: StyledAppbarTitle(
          title: "ADD ${inklingType.name.toUpperCase()}",
        ),
      ),
      body: _buildScaffoldBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
        return const LinkTextField();
    }
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: StyledElevatedButton(
        title: 'Ink It!',
        onPressed: () {},
      ),
    );
  }
}
