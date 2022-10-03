import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class StyledTitle extends StatelessWidget {
  const StyledTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.h4.copyWith(
        color: $styles.colors.grey05,
      ),
    );
  }
}

class StyledMenuTitle extends StatelessWidget {
  const StyledMenuTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.bodySmallBold.copyWith(
        color: $styles.colors.grey03,
      ),
    );
  }
}

class StyledBodyTitle extends StatelessWidget {
  const StyledBodyTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: $styles.text.bodySmall.copyWith(
        color: $styles.colors.grey04,
        height: 0,
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