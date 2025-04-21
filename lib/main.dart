import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/profile/about/about_cubit.dart';
import 'package:flowery/presentation/home/tabs/profile/terms/terms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flowery/core/utils/routes/route_generator.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';

void main() async {
  // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/language',
      fallbackLocale: const Locale('en'),
      startLocale:  Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TermsCubit>(
            create: (_) => getIt<TermsCubit>()..fetchTerms(),
          ),
          BlocProvider<AboutCubit>(
            create: (_) => getIt<AboutCubit>()..fetchAbout(),
          ),
        ],
        child: const MyApp(),
      ),
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
        theme: ThemeData.light(),
        // home: BestSellerPage(),


        onGenerateRoute: RouteGenerator.generateRoutes,
        initialRoute: RoutesNames.loginScreen,
        // ApiConstant.token != null ? RoutesNames.layout : RoutesNames.loginScreen,

        
      ),
    );
  }
}