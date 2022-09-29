import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/router.dart';
import 'dart:math' as math;

import '../../../domain/inklings/inkling.dart';
import '../../../styles/styles.dart';
import 'widgets.dart';

class InklingCard extends StatelessWidget {
  const InklingCard({
    Key? key,
    required this.inkling,
  }) : super(key: key);

  final Inkling inkling;

  @override
  Widget build(BuildContext context) {
    final inklingType = inkling.note.isEmpty
        ? inkling.link.isEmpty
            ? InklingType.link
            : InklingType.image
        : InklingType.post;

    final greyIndex = math.Random().nextInt(4);

    return GestureDetector(
      onTap: () => context.go(ScreenPaths.addInkling(inklingType)),
      child: Container(
        decoration: BoxDecoration(
          color: $styles.colors.grey[greyIndex],
          borderRadius: BorderRadius.circular($styles.corners.sm),
        ),
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  $styles.insets.xs,
                  $styles.insets.xs,
                  $styles.insets.xs,
                  0,
                ),
                child: _NoteDisplay(inkling: inkling),
              ),
            ),
            const HSpace(size: 6.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TagChip(
                    title: 'Apples',
                    isDense: true,
                    greyIndex: greyIndex + 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoteDisplay extends StatelessWidget {
  const _NoteDisplay({
    required this.inkling,
  });

  final Inkling inkling;

  @override
  Widget build(BuildContext context) {
    return Text(
      inkling.note,
      softWrap: true,
      textAlign: TextAlign.start,
      style: $styles.text.bodySmall.copyWith(
        height: 0,
        color: Colors.white,
      ),
    );
  }
}
