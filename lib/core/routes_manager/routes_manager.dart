import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/core/routes_manager/routes.dart';
import 'package:news_app_c13_offline/presentation/home/home.dart';
import 'package:news_app_c13_offline/presentation/splash/splash.dart';

class RoutesManager {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        {
          return MaterialPageRoute(
            builder: (context) => const Splash(),
          );
        }
      case Routes.home:
        {
          return MaterialPageRoute(
            builder: (context) => const Home(),
          );
        }
    }
  }
}
