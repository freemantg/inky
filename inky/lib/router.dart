import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'domain/domain.dart';
import 'presentation/presentation.dart';

/// InklingType for Inklings. Determines add route.
enum InklingType { note, image, link }

extension InklingTypeExtension on InklingType {
  String get name {
    switch (this) {
      case InklingType.note:
        return 'note';
      case InklingType.image:
        return 'image';
      case InklingType.link:
        return 'link';
    }
  }
}

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

class AppRoute extends GoRoute {
  AppRoute({
    required String path,
    required Widget Function(BuildContext, GoRouterState) builder,
    List<GoRoute> routes = const [],
    this.fadeTransition = true,
  }) : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) => fadeTransition
              ? FadeTransitionPage(
                  key: state.pageKey,
                  child: Scaffold(body: builder(context, state)),
                )
              : MaterialPage(
                  key: state.pageKey,
                  child: Scaffold(body: builder(context, state)),
                ),
        );

  final bool fadeTransition;
}

InklingType? _tryParseInklingType(String value) {
  switch (value) {
    case 'note':
      return InklingType.note;
    case 'image':
      return InklingType.image;
    case 'link':
      return InklingType.link;
    default:
      return null;
  }
}

final appRouter = GoRouter(
  routes: [
    AppRoute(
      path: ScreenPaths.home,
      builder: (_, __) => const InklingsPage(),
      routes: [
        AppRoute(
          path: ScreenPaths.tags,
          builder: ((_, __) => TagsPage(
                initialTags: __.extra as List<Tag>?,
                isManagingInklingTags: false,
              )),
        ),
        AppRoute(
          path: 'addInkling/:type',
          builder: (_, __) {
            return AddInklingPage(
              inklingType: _tryParseInklingType(__.pathParameters['type']!)!,
              inkling: __.extra as Inkling?,
            );
          },
          routes: [
            AppRoute(
              path: ScreenPaths.tags,
              builder: ((_, __) => TagsPage(
                    initialTags: __.extra as List<Tag>?,
                    isManagingInklingTags: true,
                  )),
            ),
          ],
        ),
        AppRoute(
            path: ScreenPaths.settings,
            builder: ((_, __) => const SettingsPage()),
            routes: [
              AppRoute(
                path: ScreenPaths.manageTags,
                builder: ((_, __) => const ManageTagsPage()),
              ),
            ]),
      ],
    ),
  ],
);

class FadeTransitionPage extends Page {
  final Widget child;

  const FadeTransitionPage({required this.child, LocalKey? key})
      : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
