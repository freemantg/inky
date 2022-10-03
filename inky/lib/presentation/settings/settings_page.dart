import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/presentation/shared/styled_appbar_leading_back_button.dart';
import 'package:inky/presentation/shared/styled_appbar_title.dart';
import 'package:inky/presentation/shared/styled_divider.dart';

import '../../router.dart';
import '../../styles/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const StyledAppbarLeadingBackButton(),
        title: const StyledAppbarTitle(title: 'SETTINGS'),
        centerTitle: true,
      ),
      body: _buildScaffoldBody(context),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: $styles.colors.grey01,
              borderRadius: BorderRadius.circular($styles.corners.sm),
            ),
            child: Padding(
              padding: EdgeInsets.all($styles.insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Freeman',
                    style: $styles.text.bodySmallBold,
                  ),
                  HSpace(size: $styles.insets.xs),
                  const Placeholder()
                ],
              ),
            ),
          ),
          _SettingsTile(
            title: 'Manage Tags',
            onTap: () => context.go(
              "${ScreenPaths.home}/${ScreenPaths.settings}/${ScreenPaths.manageTags}",
            ),
          ),
          StyledDivider()
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: $styles.text.bodySmall),
    );
  }
}
