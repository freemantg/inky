import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inky/presentation/add_inkling/add_inkling_page.dart';
import 'package:inky/presentation/inklings/inklings_page.dart';
import 'package:inky/presentation/tags/tags_page.dart';

/// Shared Paths
class ScreenPaths {
  static String splash = '/';
  static String home = '/home';
  static String settings = '/settings';
  static String tags = '/tags';
  static String addInkling = '/addInkling';
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
      path: ScreenPaths.addInkling,
      builder: (_) => const AddInklingPage(),
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
