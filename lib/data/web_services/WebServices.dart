import 'package:dio/dio.dart';
import 'package:flowery/core/api_constant.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/entity/auth_entity/login_entity.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'WebServices.g.dart';

@RestApi(baseUrl: 'https://flower.elevateegy.com/')
abstract class WebServices {
  factory WebServices(Dio dio) = _WebServices;

  @POST(ApiConstant.forgotPasswordApi)
  Future<ForgetPasswordResponse> forgetPaswword(
    @Body() ForgetPasswordRequest email,
  );
  @POST(ApiConstant.verifyResetCodeApi)
  Future<VerifyResetResponse> verifyReset(
      @Body() VerifyResetRequest resetCode,
      );

   @POST(ApiConstant.signInApi)
  Future<login_response_entity> login(@Body() login_request_entity request);


}

