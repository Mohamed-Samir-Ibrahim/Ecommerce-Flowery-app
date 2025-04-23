import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/routes/route_generator.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';

import 'package:flowery/presentation/home/tabs/profile/addresses_screen/addresses_screen.dart';


import 'package:flowery/presentation/auth/screens/login_screen.dart';
import 'package:flowery/presentation/home/tabs/cart/cart_screen.dart';
import 'package:flowery/presentation/home/tabs/home/best_seller/best_seller_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
void main() async {
 // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  configureDependencies();
  //ApiConstant.token = await secureStorage.read(key: 'token');
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')
      ],

      path: 'assets/language',
      fallbackLocale: Locale('ar'),
      startLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
    child: MaterialApp(
      title: 'Ecommerce Flowery',
      debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
      theme:ThemeData.light(),


      // home: CartScreen(),
      onGenerateRoute: RouteGenerator.generateRoutes,

      initialRoute: RoutesNames.loginScreen,

      // ApiConstant.token != null ? RoutesNames.layout : RoutesNames.loginScreen,


    ),
  );
  }
}