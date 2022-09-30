import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../../../router.dart';
import '../../../styles/styles.dart';

class StyledAnimatedFAB extends HookWidget {
  const StyledAnimatedFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOpen = useState(false);

    return Padding(
      padding: EdgeInsets.only(bottom: $styles.insets.xxl),
      child: FloatingActionButton.small(
        elevation: 0,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => RotationTransition(
            turns: isOpen.value
                ? Tween<double>(begin: 1, end: 0.5).animate(animation)
                : Tween<double>(begin: 0.5, end: 1).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: isOpen.value
              ? Transform.rotate(
                  angle: -math.pi / 4,
                  child: Icon(
                    Icons.add,
                    key: const ValueKey('Icons.close'),
                    color: $styles.colors.grey05,
                  ),
                )
              : Icon(
                  Icons.add,
                  key: const ValueKey('Icons.add'),
                  color: $styles.colors.grey05,
                ),
        ),
        onPressed: () {
          isOpen.value = !isOpen.value;
          isOpen.value
              ? showDialog(
                  context: context,
                  builder: ((context) => const _DialogMenu()),
                ).whenComplete(() => isOpen.value = !isOpen.value)
              : null;
        },
      ),
    );
  }
}

class _DialogMenu extends ConsumerWidget {
  const _DialogMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: _styledContainer(
        context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MenuAction(
              title: 'Note',
              iconData: Icons.edit,
              onTap: () => context.go(ScreenPaths.addInkling(InklingType.post)),
            ),
            Divider(color: $styles.colors.grey02),
            _MenuAction(
              title: 'Image',
              iconData: Icons.photo,
              onTap: () =>
                  context.go(ScreenPaths.addInkling(InklingType.image)),
            ),
            Divider(color: $styles.colors.grey02),
            _MenuAction(
              title: 'Link',
              iconData: Icons.link,
              onTap: () => context.go(ScreenPaths.addInkling(InklingType.link)),
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
        right: $styles.insets.sm,
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

class PickImageSourceButton extends StatelessWidget {
  const PickImageSourceButton({
    super.key,
    this.color,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  final String title;
  final Color? color;
  final IconData? iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: $styles.insets.md,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          HSpace(size: $styles.insets.xxs),
          Text(
            title,
            style: $styles.text.bodySmallBold.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
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
        onTap: () => onTap(),
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
              style:
                  $styles.text.bodySmall.copyWith(color: $styles.colors.grey04),
            )
          ],
        ),
      ),
    );
  }
}
