import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'infrastructure/hive/hive_database.dart';
import 'infrastructure/infrastructure.dart';
import 'providers.dart';
import 'router.dart';
import 'styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final boxes = await HiveDatabase.init();

  runApp(
    ProviderScope(
      overrides: [
        inklingLocalServiceProvider.overrideWithValue(
          InklingLocalServices(boxes['inklingDtos'] as Box<InklingDto>),
        ),
        tagsLocalServiceProvider.overrideWithValue(
          TagsLocalService(boxes['tagDtos'] as Box<TagDto>),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: $styles.colors.toThemeData(),
    );
  }
}
