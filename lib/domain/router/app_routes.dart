import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:surf_practice_magic_ball/ui/screens/home/home_screen.dart';
import 'package:surf_practice_magic_ball/ui/screens/settings/settings_screen.dart';



abstract class AppRoutes {
  const AppRoutes._();
  
  static const String home = '/';
  static const String settings = '/settings';

  static Set<AppRoute> get routes {
    const routesList = <AppRoute>[
      AppRoute(page: HomeScreen(), path: home),
      AppRoute(page: SettingsScreen(), path: home),
    ];

    return routesList.toSet();
  }
}

class AppRoute extends Equatable {
  final Widget page;
  final String path;
  const AppRoute({
    required this.page,
    required this.path,
  });

  @override
  List<Object> get props => [path];
}
