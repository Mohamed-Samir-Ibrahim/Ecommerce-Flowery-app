import 'package:flowery/presentation/screen/auth_screen/login/login_screen.dart';
import 'package:flowery/presentation/screen/home_screen/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
        //-------------------------------auth
        case RoutesNames.loginScreen:
        return MaterialPageRoute(
          builder:
              (context) => LoginScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
    }
  }
}