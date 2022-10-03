import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/providers.dart';

import '../../../styles/styles.dart';
import '../../shared/widgets.dart';

class InklingImage extends ConsumerWidget {
  const InklingImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inklingImagePath =
        ref.watch(inklingFormNotifierProvider).inkling.imagePath;

    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: $styles.colors.grey01,
          borderRadius: BorderRadius.circular($styles.corners.sm),
        ),
        child: (inklingImagePath.isNotEmpty)
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(File(inklingImagePath)),
                  const _RemoveImageButton(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: ((context) => const _DialogMenu()),
                      );
                    },
                    icon: Icon(
                      Icons.photo,
                      color: $styles.colors.grey03,
                      size: 48,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class _RemoveImageButton extends ConsumerWidget {
  const _RemoveImageButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: IconButton(
            onPressed: () =>
                ref.read(inklingFormNotifierProvider.notifier).clearImagePath(),
            icon: Icon(
              Icons.cancel,
              color: $styles.colors.grey05,
            )),
      ),
    );
  }
}

class _DialogMenu extends ConsumerWidget {
  const _DialogMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: StyledMenuContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuAction(
              title: 'Camera',
              iconData: Icons.camera_alt,
              onTap: () => ref
                  .read(inklingFormNotifierProvider.notifier)
                  .imagePathChanged(isCameraSource: true),
            ),
            Divider(color: $styles.colors.grey02),
            MenuAction(
              title: 'Gallery',
              iconData: Icons.photo_library,
              onTap: () => ref
                  .read(inklingFormNotifierProvider.notifier)
                  .imagePathChanged(isCameraSource: false),
            ),
          ],
        ),
      ),
    );
  }
}
