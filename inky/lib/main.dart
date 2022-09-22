import 'package:flutter/material.dart';
import 'package:inky/router.dart';
import 'package:inky/styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Creates an app using the [MaterialApp.router] constructor and the `appRouter`, an instance of [GoRouter].
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: $styles.colors.toThemeData(),
    );
  }
}
