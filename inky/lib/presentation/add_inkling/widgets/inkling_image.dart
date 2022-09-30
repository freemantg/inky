import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/providers.dart';

import '../../../styles/styles.dart';

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
                  GestureDetector(
                    onTap: () => ref
                        .read(inklingFormNotifierProvider.notifier)
                        .clearImagePath(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all($styles.insets.sm),
                        child: Icon(
                          Icons.cancel,
                          color: $styles.colors.grey05,
                        ),
                      ),
                    ),
                  ),
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

class _DialogMenu extends ConsumerWidget {
  const _DialogMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: _styledContainer(
        context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MenuAction(
              title: 'Camera',
              iconData: Icons.camera_alt,
              onTap: () => ref
                  .read(inklingFormNotifierProvider.notifier)
                  .imagePathChanged(isCameraSource: true),
            ),
            Divider(color: $styles.colors.grey02),
            _MenuAction(
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

  Widget _styledContainer(BuildContext context, {required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.bgGrey,
        borderRadius: BorderRadius.circular($styles.corners.md),
      ),
      margin: EdgeInsets.only(
        right: $styles.insets.xl,
        bottom: MediaQuery.of(context).size.height / 5,
      ),
      width: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.symmetric(
        vertical: $styles.insets.sm,
        horizontal: $styles.insets.xs,
      ),
      child: child,
    );
  }
}

class _MenuAction extends StatelessWidget {
  const _MenuAction({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.xxs),
      child: GestureDetector(
        onTap: () {
          onTap();
          Navigator.of(context).pop();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.ideographic,
          children: [
            Icon(
              iconData,
              color: $styles.colors.grey04,
            ),
            const VSpace(size: 12.0),
            Text(
              title,
              style: $styles.text.bodySmall.copyWith(
                color: $styles.colors.grey04,
              ),
            )
          ],
        ),
      ),
    );
  }
}
