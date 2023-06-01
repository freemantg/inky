import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'domain/domain.dart';
import 'presentation/presentation.dart';

/// InklingType for Inklings. Determines add route.
enum InklingType { note, image, link }

/// Shared Paths
class ScreenPaths {
  static String home = '/';
  static String onboarding = '/onboarding';

  //Sub Routes
  static String addInkling(InklingType type) => 'addInkling/${type.name}';
  static String tags = 'tags';

  static String settings = 'settings';
  static String manageTags = 'manageTags';
}

// Routing table, matches string paths to UI Screens
final appRouter = GoRouter(
  routes: [
    AppRoute(
      path: ScreenPaths.home,
      builder: (_) => const InklingsPage(),
      routes: [
        AppRoute(
          path: ScreenPaths.tags,
          builder: ((_) => TagsPage(
                initialTags: _.extra as List<Tag>?,
                isManagingInklingTags: false,
              )),
        ),
        AppRoute(
          path: 'addInkling/:type',
          builder: (_) {
            return AddInklingPage(
              inklingType: _tryParseInklingType(_.pathParameters['type']!)!,
              inkling: _.extra as Inkling?,
            );
          },
          routes: [
            AppRoute(
              path: ScreenPaths.tags,
              builder: ((_) => TagsPage(
                    initialTags: _.extra as List<Tag>?,
                    isManagingInklingTags: true,
                  )),
            ),
          ],
        ),
        AppRoute(
            path: ScreenPaths.settings,
            builder: ((_) => const SettingsPage()),
            routes: [
              AppRoute(
                path: ScreenPaths.manageTags,
                builder: ((_) => const ManageTagsPage()),
              ),
            ]),
      ],
    ),
    AppRoute(
      path: ScreenPaths.onboarding,
      builder: (_) => const OnboardingPage(),
    ),
  ],
);

// Custom GoRoute sub-class to make the router custom transitions declaration easier.
class AppRoute extends GoRoute {
  AppRoute({
    required String path,
    required Widget Function(GoRouterState s) builder,
    List<GoRoute> routes = const [],
    this.fadeTransition = true,
  }) : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
            );
            if (fadeTransition) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            } else {
              return CupertinoPage(child: pageContent);
            }
          },
        );

  final bool fadeTransition;
}

InklingType? _tryParseInklingType(String value) =>
    InklingType.values.asNameMap()[value];
