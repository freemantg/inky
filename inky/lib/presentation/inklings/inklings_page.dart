import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/router.dart';
import 'package:inky/styles/styles.dart';
import 'dart:math' as math;

class InklingsPage extends StatelessWidget {
  const InklingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(
          color: $styles.colors.grey04,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => context.go(ScreenPaths.tags),
            icon: const Icon(Icons.filter_list_alt),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      floatingActionButton: const StyledAnimatedFAB(),
      body: Padding(
        padding: EdgeInsets.all($styles.insets.sm),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: $styles.insets.xs,
          mainAxisSpacing: $styles.insets.xs,
          children: const [
            Post(),
            Post(),
            Post(),
            Post(),
          ],
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final greyIndex = math.Random().nextInt(4);

    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.grey[greyIndex],
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          const Expanded(child: Placeholder()),
          const HSpace(size: 6.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TagChip(
                    title: 'Apples', isDense: true, greyIndex: greyIndex + 1),
                TagChip(
                    title: 'Maple', isDense: true, greyIndex: greyIndex + 1),
                TagChip(title: 'New', isDense: true, greyIndex: greyIndex + 1),
                TagChip(
                    title: 'Hello', isDense: true, greyIndex: greyIndex + 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                  builder: ((context) => Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: $styles.colors.bgGrey,
                            borderRadius:
                                BorderRadius.circular($styles.corners.md),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MenuAction(
                                title: 'Note',
                                iconData: Icons.edit,
                                onTap: () => context.go(ScreenPaths.addInkling),
                              ),
                              Divider(color: $styles.colors.grey02),
                              MenuAction(
                                title: 'Image',
                                iconData: Icons.photo,
                                onTap: () {},
                              ),
                              Divider(color: $styles.colors.grey02),
                              MenuAction(
                                title: 'Link',
                                iconData: Icons.link,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      )),
                ).whenComplete(
                  () => isOpen.value = !isOpen.value,
                )
              : null;
        },
      ),
    );
  }
}

class MenuAction extends StatelessWidget {
  const MenuAction({
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
              style: $styles.text.title2.copyWith(
                color: $styles.colors.grey04,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip({
    Key? key,
    required this.title,
    this.isDense = false,
    this.greyIndex,
  }) : super(key: key);
  final String title;
  final bool isDense;
  final int? greyIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2.0),
      padding: EdgeInsets.symmetric(
        vertical: isDense ? 2.0 : $styles.insets.xxs,
        horizontal: isDense ? $styles.insets.xxs : $styles.insets.xs,
      ),
      decoration: BoxDecoration(
        color: $styles.colors.grey[greyIndex ?? math.Random().nextInt(2)],
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Text(
        '#$title',
        style: $styles.text.caption.copyWith(
          color: isDense ? null : Colors.black,
          fontSize: isDense ? 10.0 : null,
        ),
      ),
    );
  }
}
