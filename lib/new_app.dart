import 'package:flutter/material.dart';
import 'package:news_app_c13_offline/config/theme/theme_manager.dart';
import 'package:news_app_c13_offline/core/routes_manager/routes.dart';
import 'package:news_app_c13_offline/core/routes_manager/routes_manager.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RoutesManager.getRoute,
      initialRoute: Routes.home,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );
  }
}
