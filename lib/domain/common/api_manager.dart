

// import 'package:dio/dio.dart';
// import 'package:flowery/core/api_constant.dart';
// import 'package:injectable/injectable.dart';

// @singleton
// class ApiManager {
//   final client= RestClient(Dio(BaseOptions(
//     baseUrl: ApiConstant.baseUrl 
//   )));

 
//   Future<Response> getRequest(
//       {required String endpoint, Map<String, dynamic>? queryParameters}) async {
//       CategoriesResponse catRes= await client.getCategories();
//     //var response = await dio.get(endpoint, queryParameters: queryParameters);
//     return catRes;
//   }

//   Future<Response> postRequest(
//     {required String endpoint, Map<String, dynamic>? body}) async {
//     CategoriesResponse catRes= await client.getCategories();
//     //var response = await dio.post(endpoint, data: body);
//     return catRes;
//   }
// }