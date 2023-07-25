import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/router/app_routes.dart';
import 'package:surf_practice_magic_ball/ui/screens/error_404/error_404_page.dart';


class AppRouter {
  static const _pageDuration = Duration(milliseconds: 1000);
  static String get initRoute => AppRoutes.home;

  static Route generate(RouteSettings settings) {
    final routeName = settings.name?.trim();

    if (routeName == null) return _errorRoute404;

    final allAppRoutes = AppRoutes.routes.toList();

    for (var appRoute in allAppRoutes) {
      if (routeName != appRoute.path) continue;

      final newRoute = _getRouteTemplate(
        child: appRoute.page,
        settings: settings,
      );

      return newRoute;
    }

    return _errorRoute404;
  }

  static Route _getRouteTemplate({
    required Widget child,
    required RouteSettings settings,
  }) {
    return PageRouteBuilder(
      transitionDuration: _pageDuration,
      reverseTransitionDuration: _pageDuration,
      pageBuilder: (_, __, ___) => child,
    );
  }

  static final Route _errorRoute404 = MaterialPageRoute(
    settings: const RouteSettings(name: '/404'),
    builder: (_) => const Error404Page(),
  );
}
