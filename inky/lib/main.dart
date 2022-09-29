import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inky/infrastructure/core/hive_database.dart';
import 'package:inky/router.dart';
import 'package:inky/styles/styles.dart';

void main() async {
  await HiveDatabase().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Creates an app using the [MaterialApp.router] constructor and the `appRouter`, an instance of [GoRouter].
  ///
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: $styles.colors.toThemeData(),
      ),
    );
  }
}
