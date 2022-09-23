import 'package:flutter/material.dart';
import 'package:inky/presentation/shared/styled_divider.dart';
import 'package:inky/presentation/shared/styled_elevated_button.dart';

import '../../styles/styles.dart';
import '../shared/styled_appbar_action.dart';
import '../shared/styled_appbar_leading_back_button.dart';
import '../shared/styled_appbar_title.dart';
import 'widgets/styled_modal_bottom_sheet.dart';

class ManageTagsPage extends StatelessWidget {
  const ManageTagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [StyledAppbarAction(title: 'SAVE')],
        title: const StyledAppbarTitle(title: 'MANAGE TAGS'),
        leading: const StyledAppbarLeadingBackButton(),
      ),
      body: _buildScaffoldBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: EdgeInsets.only(top: $styles.insets.sm),
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (_, __) => StyledDivider(),
        itemBuilder: (context, index) => const _TagTile(),
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
  const _TagTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      title: Text('UI/UX', style: $styles.text.bodySmallBold),
      trailing: Icon(Icons.remove_circle, color: $styles.colors.accent1),
    );
  }
}
