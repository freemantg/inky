import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
            ? InklingType.image
            : InklingType.link
        : InklingType.post;

    final greyIndex = math.Random().nextInt(4);

    return GestureDetector(
      onTap: () => context.go(
        ScreenPaths.addInkling(inklingType),
        extra: inkling,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: $styles.colors.grey[greyIndex],
          borderRadius: BorderRadius.circular($styles.corners.sm),
        ),
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _buildInklingCardDisplay(inklingType, greyIndex)),
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

  Widget _buildInklingCardDisplay(InklingType type, int greyIndex) {
    switch (type) {
      case InklingType.post:
        return _NoteDisplay(inkling: inkling);
      case InklingType.image:
        return _ImageDisplay(inkling: inkling);
      case InklingType.link:
        return _LinkDisplay(
          inkling: inkling,
          greyIndex: greyIndex,
        );
    }
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

class StyledLinkTitleAndSubtitle extends StatelessWidget {
  const StyledLinkTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: $styles.insets.xxs),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? '',
            maxLines: 1,
            style: $styles.text.bodySmall.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Text(
            subtitle ?? '',
            style: $styles.text.caption.copyWith(fontSize: 11),
            overflow: TextOverflow.ellipsis,
          )
        ],
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
