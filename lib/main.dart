import 'package:flowery/core/utils/routes/route_generator.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
void main() async {
 // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  configureDependencies();
  //ApiConstant.token = await secureStorage.read(key: 'token');
  runApp(MyApp());
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
      theme:ThemeData.light(),
      // home: LoginScreen(),
      onGenerateRoute: RouteGenerator.generateRoutes,
        initialRoute: RoutesNames.forgetPassword,
      //ApiConstant.token != null ? RoutesNames.layout : RoutesNames.loginScreen,
      //onGenerateRoute: RouteGenerator.generateRoutes,
    ),
  );
  }
}