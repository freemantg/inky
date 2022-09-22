import 'package:flutter/material.dart';

class AppColors {
  /// App Colors
  final Color accent1 = const Color(0xFFF15A24);
  final Color bgGrey = const Color(0xFFD6DBDC);
  final List<Color> grey = [
    const Color(0xFFC2CBCD),
    const Color(0xFFA3B3BA),
    const Color(0xFF717D82),
    const Color(0xFF5A676B),
    const Color(0xFF4A5055),
    const Color(0xFF2D2D2D),
  ];
  final Color grey01 = const Color(0xFFC2CBCD);
  final Color grey02 = const Color(0xFFA3B3BA);
  final Color grey03 = const Color(0xFF717D82);
  final Color grey04 = const Color(0xFF5A676B);
  final Color grey05 = const Color(0xFF4A5055);
  final Color grey06 = const Color(0xFF2D2D2D);

  final bool isDark = false;

  ThemeData toThemeData() {
    /// Create a TextTheme and ColorScheme, that will be used to generate ThemeData;
    final TextTheme textTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    const Color textColor = Colors.white;
    final ColorScheme colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: accent1,
      secondary: accent1,
      background: bgGrey,
      surface: bgGrey,
      onSecondary: Colors.white,
      onPrimary: Colors.white,
      onError: Colors.white,
      onBackground: textColor,
      onSurface: textColor,
      error: Colors.red.shade400,
    );
    final theme = ThemeData.from(
      textTheme: textTheme,
      colorScheme: colorScheme,
    );

    ///Return the themeData which MaterialApp can now use
    return theme;
  }
}
