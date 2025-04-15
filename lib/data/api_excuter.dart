
import 'package:dio/dio.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/error_model.dart';
import 'package:flowery/domain/exception/server_error.dart';

typedef ApiCall<T> = Future<T> Function();

Future<ApiResult<T>> executeApi<T>(ApiCall<T> apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on DioException catch (ex) {
    switch (ex.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        {
          return Error(NetworkError());
        }
      case DioExceptionType.badResponse:
        {
          var responseCode = ex.response?.statusCode ?? 0;
          var errorModel = ErrorModel.fromJson(ex.response?.data);
          if (responseCode >= 400 && responseCode < 500) {
            return Error(ClientError(errorModel));
          }
          if (responseCode >= 500 && responseCode < 600) {
            return Error(ServerError(errorModel));
          }
          return Error(Exception("Something went wrong!"));
        }
      default:
        {
          return Error(Exception("Something went wrong!"));
        }
    }
  } on  Exception catch(ex){
    return Error(ex);
  }
}