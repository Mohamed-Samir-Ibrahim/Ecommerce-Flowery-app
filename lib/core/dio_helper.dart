import 'package:dio/dio.dart';
import 'package:flowery/core/api_constant.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:injectable/injectable.dart';

import '../di/injetible_intinalizer.dart';
import '../domain/use_case/auth_use_case/forget_password_use_case.dart';
import '../domain/use_case/auth_use_case/reset_password_use_case.dart';
import '../domain/use_case/auth_use_case/verify_reset_use_case.dart';
import '../presentation/auth/cubit/auth_view_model.dart';

@module
abstract class DioModule {

  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor();
  }

  @Singleton()
  Dio provideDIO(LogInterceptor logInterceptor) {
    var dio = Dio(  BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",

      },
    ),);
    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  WebServices provideWebServices(Dio dio) {
    return WebServices(dio);
  }

}
