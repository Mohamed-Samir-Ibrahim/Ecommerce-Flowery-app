import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/presentation/auth/screens/forget_password_screen.dart';
import 'package:flowery/presentation/auth/screens/otp_screen.dart';
import 'package:flowery/presentation/auth/screens/signup_screen.dart';

import 'package:flowery/presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flowery/presentation/home/tabs/cart/checkout_page.dart';
import 'package:flowery/presentation/home/tabs/cart/order_page.dart';
import 'package:flowery/presentation/home/tabs/cart/web_view_page.dart';
import 'package:flowery/presentation/home/tabs/category/category_screen.dart';
import 'package:flowery/presentation/home/tabs/home/best_seller/best_seller_page.dart';

import 'package:flowery/presentation/home/tabs/home/products/component/product_details_view.dart';

import 'package:flowery/presentation/home/tabs/home/home_screen.dart';


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
          builder:
              (context) => SignUpScreen(),);
      case RoutesNames.bottomNavScreen:
        return MaterialPageRoute(
          builder: (context) => BottomNavScreen(),
          settings: settings,
        );
      case RoutesNames.resetPassWord:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
          settings: settings,
        );  case RoutesNames.homeScreen:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
        settings: settings,
      );
      case RoutesNames.mostSellingScreen:
        return MaterialPageRoute(
          builder: (context) => BestSellerPage(),
          settings: settings,
        );
        // case RoutesNames.productsDetailsView:
        // return MaterialPageRoute(
        //   builder: (context) => ProductDetailsView(),
        //   settings: settings,
        // );
      case RoutesNames.categoriesView:
        return MaterialPageRoute(
          builder: (context) => CategoryScreen(),
          settings: settings,
        );
      case RoutesNames.orderPage:
        return MaterialPageRoute(
          builder: (context) => OrderPage(),
          settings: settings,
        );
      case RoutesNames.checkoutPage:
        return MaterialPageRoute(
          builder: (context) => CheckoutPage(),
          settings: settings,
        );   case RoutesNames.webViewPage:
      return MaterialPageRoute(
        builder: (context) => PaymentWebViewPage(),
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
