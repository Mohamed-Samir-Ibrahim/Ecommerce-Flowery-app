import 'package:dio/dio.dart';
import 'package:flowery/core/api_constant.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';

import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/domain/entity/auth_entity/login_entity.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/domain/entity/home_entity/product_response_entity/product_response_entity.dart';




import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';

import 'package:flowery/data/model/home_model/home_model.dart';



import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../domain/entity/Categotries_entity/category_model.dart';
import '../../domain/entity/auth_entity/login_entity.dart';
import '../../domain/entity/auth_entity/login_request_entity.dart';
import '../model/auth_model/reset_password/reset_password_request.dart';
import '../model/auth_model/reset_password/reset_password_response.dart';

import '../model/auth_model/signup/signup_response.dart';

part 'WebServices.g.dart';

@RestApi(baseUrl: 'https://flower.elevateegy.com/')
abstract class WebServices {
  factory WebServices(Dio dio) = _WebServices;

  @GET(ApiConstant.bestSeller)
  Future<BestSellerResponseDto> get();

  @GET(ApiConstant.bestSeller)
  Future<ProductResponseDto> getProduct();
  @POST(ApiConstant.getAllProducts)


  @POST(ApiConstant.forgotPasswordApi)

  Future<ForgetPasswordResponse> forgetPaswword(
      @Body() ForgetPasswordRequest email,
      );

  @POST(ApiConstant.verifyResetCodeApi)
  Future<VerifyResetResponse> verifyReset(@Body() VerifyResetRequest resetCode);

  @PUT(ApiConstant.resetPasswordApi)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest request,
      );

  @POST("api/v1/auth/signup")
  Future<SignupResponseDto> Signup(@Body() Map<String, dynamic> body);

  @POST(ApiConstant.signInApi)

  Future<login_response_entity> login(@Body() login_request_entity request);


  @GET(ApiConstant.getHomeApi)
  Future<HomeModel> getHomeScreen();


  @GET(ApiConstant.getAllCategories)
  Future<Category_response_entity> getCategories();

  @GET(ApiConstant.getAllProducts)
  Future<ProductByOccasion> getOcassionProducts(
      @Query("occasion") String occasion,
      );
  @GET(ApiConstant.getAllProducts)
  Future<ProductByOccasion> getCategoryProducts(
      @Query("category") String category,
      );
  @GET(ApiConstant.getAllProducts)
  Future<ProductByOccasion> getAllProducts(
      );
}
