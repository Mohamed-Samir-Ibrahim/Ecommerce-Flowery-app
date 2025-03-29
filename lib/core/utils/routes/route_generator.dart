import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/presentation/auth/screens/forget_password_screen.dart';
import 'package:flowery/presentation/auth/screens/otp_screen.dart';

import 'package:flowery/presentation/auth/screens/signup_screen.dart';
import 'package:flowery/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

import '../../../presentation/auth/screens/login_screen.dart';
import '../../../presentation/auth/screens/reset_password_screen.dart';
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
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case RoutesNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPassword(),
          settings: settings,
        );
      case RoutesNames.emailVerification:
        return MaterialPageRoute(
          builder:
              (context) => OtpScreen(),);
      case RoutesNames.registerScreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
          settings: settings,
        );
      case RoutesNames.bottomNavScreen:
        return MaterialPageRoute(
          builder: (context) => BottomNavScreen(),
          settings: settings,
        );
      case RoutesNames.resetPassWord:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
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
