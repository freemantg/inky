import 'package:flutter/material.dart';
import 'package:inky/styles/theme.dart';

final $styles = AppStyle();

class AppStyle {
  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Padding and margin values
  late final _Insets insets = _Insets();

  /// Rounded edge corner radii
  late final _Corners corners = _Corners();

  /// Text styles
  late final _Text text = _Text();
}

@immutable
class _Text {
  final TextStyle _pretendard = const TextStyle(fontFamily: 'Pretendard');
  final TextStyle _perandory = const TextStyle(fontFamily: 'Perandory');
  final TextStyle _theSansTypewriter =
      const TextStyle(fontFamily: 'The Sans Typewriter');

  TextStyle get titleFont => _pretendard;
  TextStyle get contentFont => _pretendard;

  late final TextStyle h1 = copy(titleFont, sizePx: 64, heightPx: 62);
  late final TextStyle h2 = copy(titleFont, sizePx: 32, heightPx: 46);
  late final TextStyle h3 =
      copy(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w600);
  late final TextStyle h4 = copy(contentFont,
      sizePx: 14, heightPx: 23, spacingPc: 5, weight: FontWeight.w600);

  late final TextStyle title1 =
      copy(titleFont, sizePx: 16, heightPx: 26, spacingPc: 5);
  late final TextStyle title2 = copy(titleFont, sizePx: 14, heightPx: 16.38);

  late final TextStyle body = copy(contentFont, sizePx: 16, heightPx: 27);
  late final TextStyle bodyBold =
      copy(contentFont, sizePx: 16, heightPx: 26, weight: FontWeight.w600);
  late final TextStyle bodySmall = copy(contentFont, sizePx: 14, heightPx: 23);
  late final TextStyle bodySmallBold =
      copy(contentFont, sizePx: 14, heightPx: 23, weight: FontWeight.w600);

  late final TextStyle caption =
      copy(contentFont, sizePx: 12, weight: FontWeight.w500)
          .copyWith(color: Colors.white);

  TextStyle copy(
    TextStyle style, {
    required double sizePx,
    double? heightPx,
    double? spacingPc,
    FontWeight? weight,
  }) {
    return style.copyWith(
      fontSize: sizePx,
      height: heightPx != null ? (heightPx / sizePx) : style.height,
      letterSpacing:
          spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
      fontWeight: weight,
    );
  }
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

@immutable
class _Insets {
  late final double xxxs = 2;
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

class Space extends StatelessWidget {
  final double width;
  final double height;

  const Space({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

class VSpace extends StatelessWidget {
  final double size;
  const VSpace({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Space(width: size, height: 0);
  }
}

class HSpace extends StatelessWidget {
  final double size;
  const HSpace({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Space(width: 0, height: size);
  }
}