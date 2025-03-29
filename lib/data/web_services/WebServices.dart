import 'package:dio/dio.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'WebServices.g.dart';
@RestApi(baseUrl: 'https://flower.elevateegy.com/')
abstract class WebServices{
  factory WebServices(Dio dio,) = _WebServices;

  @POST("api/v1/auth/signup")
  Future<SignupResponseDto>getpost(
  @Body(
  )
  Map<String,dynamic>body
      );

}