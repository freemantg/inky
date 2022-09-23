import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router.dart';
import '../../styles/styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(ScreenPaths.home),
          icon: const Icon(Icons.arrow_back_ios_new, size: 14.0),
        ),
        centerTitle: true,
        title: Text(
          'SETTINGS',
          style: $styles.text.h4.copyWith(
            color: $styles.colors.grey05,
          ),
        ),
      ),
      body: Padding(
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
            SettingsTile(
              title: 'Manage Tags',
              onTap: () => context.go(ScreenPaths.manageTags),
            ),
            Divider(
              color: $styles.colors.grey02,
              height: $styles.insets.xxs,
            )
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
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
