import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/providers.dart';

import '../../styles/styles.dart';

class TagFilterTextField extends HookConsumerWidget {
  const TagFilterTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: '');
    final canAddTag = useState(false);

    controller.addListener(
      () {
        if (controller.text.isEmpty) {
          canAddTag.value = false;
        } else {
          canAddTag.value = true;
        }
      },
    );

    return TextField(
      controller: controller,
      style: $styles.text.bodySmall,
      decoration: InputDecoration(
        hintText: 'Type to filter...',
        hintStyle: $styles.text.bodySmall,
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () => ref
                    .read(tagsNotifierProvider.notifier)
                    .addTag(controller.text)
                    .then((_) => controller.clear()),
                icon: const Icon(Icons.add),
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
