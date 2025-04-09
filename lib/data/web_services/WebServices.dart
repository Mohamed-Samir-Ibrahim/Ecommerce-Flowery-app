import 'package:dio/dio.dart';
import 'package:flowery/core/api_constant.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/auth_model/reset_password/reset_password_request.dart';
import '../model/auth_model/reset_password/reset_password_response.dart';

import '../model/auth_model/signup/signup_request.dart';
import '../model/auth_model/signup/signup_response.dart';

part 'WebServices.g.dart';
@RestApi(baseUrl: 'https://flower.elevateegy.com/')
abstract class WebServices {
  factory WebServices(Dio dio) = _WebServices;

  @GET(ApiConstant.bestSeller)
  Future<BestSellerResponseDto> get();
  @POST(ApiConstant.forgotPasswordApi)
  Future<ForgetPasswordResponse> forgetPaswword(
    @Body() ForgetPasswordRequest email,
  );
  @POST(ApiConstant.verifyResetCodeApi)
  Future<VerifyResetResponse> verifyReset(
      @Body() VerifyResetRequest resetCode,
      );
  @PUT(ApiConstant.resetPasswordApi)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest request,
      );

  @POST("api/v1/auth/signup")
  Future<SignupResponseDto>Signup(
      @Body() Map<String,dynamic>body,
      );
}
