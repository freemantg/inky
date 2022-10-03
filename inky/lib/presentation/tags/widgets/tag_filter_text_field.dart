import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inky/presentation/shared/widgets.dart';

import '../../../providers.dart';
import '../../../styles/styles.dart';

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
      decoration: StyledInputDecoration(
        hintText: 'Type to filter...',
        prefixIcon: Icon(
          Icons.search,
          color: $styles.colors.grey04,
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () => ref
                    .read(tagsNotifierProvider.notifier)
                    .createTag(controller.text)
                    .then((_) => controller.clear()),
                icon: Icon(
                  Icons.add,
                  color: $styles.colors.accent1,
                ),
              ),
      ),
    );
  }
}
