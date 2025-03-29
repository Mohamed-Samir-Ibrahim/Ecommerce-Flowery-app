// ignore_for_file: must_be_immutable

import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/core/utils/routes/route_generator.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
 configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  //const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  //ApiConstant.token = await secureStorage.read(key: 'token');
  String? token = await SecureStorageService().getToken();


  runApp(MyApp(token:token));
}


class MyApp extends StatelessWidget {
   MyApp({super.key,required this.token});
  String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
    child: MaterialApp(
      title: 'Ecommerce Flowery',
      debugShowCheckedModeBanner: false,
      theme:ThemeData.light(),
      initialRoute:  token != null ? RoutesNames.bottomNavScreen : RoutesNames.loginScreen,
      onGenerateRoute: RouteGenerator.generateRoutes,
    ),
  );
  }
}