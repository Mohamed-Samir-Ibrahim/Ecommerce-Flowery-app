import 'package:dio/dio.dart';
import 'package:flowery/core/api_constant.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {

  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor();
  }

  @Singleton()
  Dio provideDIO(LogInterceptor logInterceptor) {
    var dio = Dio(  BaseOptions(
      baseUrl: ApiConstant.baseUrl, // استبدل برابط API الحقيقي
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
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
