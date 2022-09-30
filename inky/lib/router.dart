import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/presentation/add_inkling/add_inkling_page.dart';
import 'package:inky/presentation/inklings/inklings_page.dart';
import 'package:inky/presentation/onboarding/onboarding_page.dart';
import 'package:inky/presentation/settings/manage_tags_page.dart';
import 'package:inky/presentation/settings/settings_page.dart';
import 'package:inky/presentation/tags/tags_page.dart';

import 'domain/inklings/inkling.dart';

/// InklingType for navigating the add Inkling process.
enum InklingType { post, image, link }

/// Shared Paths
class ScreenPaths {
  static String splash = '/';
  static String home = '/home';
  static String settings = '/settings';
  static String manageTags = '/manageTags';
  static String tags = '/tags';
  static String onboarding = '/onboarding';
  static String addInkling(InklingType type) => '/addInkling/${type.name}';
}

// Routing table, matches string paths to UI Screens
final appRouter = GoRouter(
  routes: [
    AppRoute(
      path: ScreenPaths.splash,
      builder: (_) => const InklingsPage(),
    ),
    AppRoute(
      path: ScreenPaths.home,
      builder: (_) => const InklingsPage(),
    ),
    AppRoute(
      path: ScreenPaths.tags,
      builder: ((_) => const TagsPage()),
    ),
    AppRoute(
      path: ScreenPaths.settings,
      builder: ((_) => const SettingsPage()),
    ),
    AppRoute(
      path: ScreenPaths.settings,
      builder: ((_) => const SettingsPage()),
    ),
    AppRoute(
      path: ScreenPaths.manageTags,
      builder: ((_) => const ManageTagsPage()),
    ),
    AppRoute(
      path: ScreenPaths.onboarding,
      builder: (_) => const OnboardingPage(),
    ),
    AppRoute(
      path: '/addInkling/:type',
      builder: (_) {
        return AddInklingPage(
          inklingType: _tryParseInklingType(_.params['type']!)!,
          inkling: _.extra as Inkling?,
        );
      },
    )
  ],
);

/// Custom GoRoute sub-class to make the router custom transitions declaration easier.
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
