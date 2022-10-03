import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/presentation/shared/widgets.dart';
import 'dart:math' as math;

import '../../../router.dart';
import '../../../styles/styles.dart';
import '../../shared/styled_menu_action.dart';
import '../../shared/styled_menu_container.dart';

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
        heroTag: null,
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

class _DialogMenu extends StatelessWidget {
  const _DialogMenu();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: StyledMenuContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuAction(
              title: 'Note',
              iconData: Icons.edit,
              onTap: () => context.go(
                  "${ScreenPaths.home}${ScreenPaths.addInkling(InklingType.note)}"),
            ),
            Divider(color: $styles.colors.grey02),
            MenuAction(
              title: 'Image',
              iconData: Icons.photo,
              onTap: () => context.go(
                  "${ScreenPaths.home}${ScreenPaths.addInkling(InklingType.image)}"),
            ),
            Divider(color: $styles.colors.grey02),
            MenuAction(
              title: 'Link',
              iconData: Icons.link,
              onTap: () => context.go(
                  "${ScreenPaths.home}${ScreenPaths.addInkling(InklingType.link)}"),
            ),
          ],
        ),
      ),
    );
  }
}

