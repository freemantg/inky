import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/router.dart';
import 'dart:math' as math;

import '../../../domain/inklings/inkling.dart';
import '../../../styles/styles.dart';
import '../../shared/styled_titles.dart';
import 'widgets.dart';

class InklingCard extends StatelessWidget {
  const InklingCard({
    Key? key,
    required this.inkling,
  }) : super(key: key);

  final Inkling inkling;

  @override
  Widget build(BuildContext context) {
    //Decides the color of the Inkling card using grey scale $styles.colors.grey[]
    //Greys go up to 6 shades
    final greyIndex = math.Random().nextInt(5);

    //Determines the type of inkling else returns a Note Inkling
    final inklingType = inkling.note.isEmpty
        ? inkling.link.isEmpty
            ? inkling.imagePath.isEmpty
                ? InklingType.note
                : InklingType.image
            : InklingType.link
        : InklingType.note;

    return Container(
      decoration: BoxDecoration(
        color: $styles.colors.grey[greyIndex],
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      padding: EdgeInsets.all($styles.insets.xxs),
      child: GestureDetector(
        onTap: () => context.go(
          "${ScreenPaths.home}${ScreenPaths.addInkling(inklingType)}",
          extra: inkling,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _buildInklingCardDisplay(inklingType, greyIndex)),
            HSpace(size: $styles.insets.xxs),
            _MiniTagRow(inkling: inkling, greyIndex: greyIndex),
          ],
        ),
      ),
    );
  }

  Widget _buildInklingCardDisplay(InklingType type, int greyIndex) {
    switch (type) {
      case InklingType.note:
        return _NoteDisplay(inkling: inkling);
      case InklingType.image:
        return _ImageDisplay(inkling: inkling);
      case InklingType.link:
        return _LinkDisplay(inkling: inkling, greyIndex: greyIndex);
    }
  }
}

class _MiniTagRow extends StatelessWidget {
  const _MiniTagRow({
    required this.inkling,
    required this.greyIndex,
  });

  final Inkling inkling;
  final int greyIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: inkling.tags
            .map((e) => TagChip(
                  tag: e,
                  isDense: true,
                  greyIndex: greyIndex + 1,
                ))
            .toList(),
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
    return Padding(
      padding: EdgeInsets.all($styles.insets.xs),
      child: Text(
        inkling.note,
        softWrap: true,
        textAlign: TextAlign.start,
        style: $styles.text.bodySmall.copyWith(
          height: 0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ImageDisplay extends StatelessWidget {
  const _ImageDisplay({required this.inkling});

  final Inkling inkling;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Image.file(
        File(inkling.imagePath),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _LinkDisplay extends StatelessWidget {
  const _LinkDisplay({
    required this.inkling,
    required this.greyIndex,
  });

  final Inkling inkling;
  final int greyIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: $styles.colors.grey[greyIndex + 1],
        borderRadius: BorderRadius.circular($styles.corners.sm),
      ),
      child: Column(
        children: [
          if (inkling.metaData?.imageUrl != null)
            Expanded(
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                imageUrl: inkling.metaData!.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          StyledLinkTitleAndSubtitle(
            title: inkling.metaData?.title,
            subtitle: inkling.metaData?.url,
          )
        ],
      ),
    );
  }
}
