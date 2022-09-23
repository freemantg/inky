import 'package:flutter/material.dart';

import '../../router.dart';
import '../../styles/styles.dart';
import '../shared/widgets.dart';
import 'widgets/widgets.dart';


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
