import 'package:flowery/core/utils/routes/routes_names.dart';

import 'package:flutter/material.dart';

import '../../../presentation/auth/screens/login_screen.dart';
import '../../../presentation/home/layout_view.dart';


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