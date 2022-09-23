import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/router.dart';
import 'package:inky/styles/styles.dart';

import '../inklings/widgets/widgets.dart';


class TagsPage extends StatelessWidget {
  const TagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(ScreenPaths.home),
          icon: const Icon(Icons.arrow_back_ios_new, size: 14.0),
        ),
        title: Text(
          'SELECT TAGS',
          style: $styles.text.h4.copyWith(
            color: $styles.colors.grey05,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'DONE',
              style: $styles.text.h4.copyWith(
                color: $styles.colors.grey04,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TagFilterTextField(),
            HSpace(size: $styles.insets.lg),
            Text('Your Tags', style: $styles.text.bodySmallBold),
            HSpace(size: $styles.insets.xs),
            Expanded(
              child: ListView.builder(
                itemCount: 40,
                shrinkWrap: true,
                itemBuilder: (context, index) => Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: $styles.insets.xs),
                    child: const TagChip(title: 'Hello'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TagFilterTextField extends HookWidget {
  const TagFilterTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '');

    return TextField(
      controller: controller,
      style: $styles.text.bodySmall,
      decoration: InputDecoration(
        hintText: 'Type to filter...',
        hintStyle: $styles.text.bodySmall,
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () {},
                icon: const Icon(Icons.clear),
              ),
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(
          Icons.search,
          color: $styles.colors.grey04,
        ),
        filled: true,
        fillColor: $styles.colors.grey01,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular($styles.corners.sm),
        ),
      ),
    );
  }
}
