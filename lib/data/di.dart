
// import 'package:dio/dio.dart';
// import 'package:flowery/data/web_services/WebServices.dart';
// import 'package:injectable/injectable.dart';
// @module
// abstract class DioModule{
//   @singleton
//   LogInterceptor ProvideLogger(){
//
//     return LogInterceptor();
//   }
//
//
//   @singleton
//   Dio ProvideDio(LogInterceptor Log){
//
//     var dio = Dio(
//
//       BaseOptions(validateStatus: (_)=>true,
//         baseUrl: 'https://flower.elevateegy.com/'
//       )
//
//     );
//
//     dio.interceptors.add(Log);
//     return dio;
//   }
//
//   @singleton
//   WebServices ProvideWebServices(Dio dio){
//     return WebServices(dio);
//
//
//   }
//
// }