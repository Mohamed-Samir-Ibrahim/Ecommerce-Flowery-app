import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/routes/route_generator.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_view_model.dart';
import 'package:flowery/presentation/home/tabs/profile/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')
      ],
      path: 'assets/language',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => getIt.get<ProfileViewModel>(),
        ),
      ],

      child: MyApp()),
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
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: RoutesNames.loginScreen,
    ),
  );
  }
}