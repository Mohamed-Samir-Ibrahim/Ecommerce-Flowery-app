import 'package:dio/dio.dart';
import 'package:flowery/core/api_constant.dart';
import 'package:flowery/core/utils/add_cart_button.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/model/cart_model/cart_response_dto.dart';

import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';
import 'package:flowery/data/model/home_model/product_by_occasion.dart';
import 'package:flowery/data/model/home_model/product_model/product_response_dto.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/data/model/profile_model/AddAddressResponseDto.dart';
import 'package:flowery/data/model/profile_model/CitiesResponseDto.dart';
import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/entity/auth_entity/login_entity.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';
import 'package:flowery/domain/entity/cart_entity/GetCartEntity.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/entity/cart_entity/delete_item.dart';
import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';
import 'package:flowery/domain/entity/home_entity/product_response_entity/product_response_entity.dart';

import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';

import 'package:flowery/data/model/home_model/home_model.dart';
import 'package:flowery/domain/entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';

import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../domain/common/api_result.dart';
import '../../domain/entity/Categotries_entity/category_model.dart';
import '../../domain/entity/auth_entity/login_entity.dart';
import '../../domain/entity/auth_entity/login_request_entity.dart';
import '../../domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import '../model/auth_model/reset_password/reset_password_request.dart';
import '../model/auth_model/reset_password/reset_password_response.dart';

import '../model/auth_model/signup/signup_response.dart';
import '../model/cart_model/cart_request.dart';
import '../model/profile_model/change_password/change_password_res_dto.dart';
import '../model/profile_model/edit_profile/edit_profile_response_dto.dart';
import '../model/profile_model/get_logged_user_data/get_logged_user_data_response_dto.dart';
import '../model/profile_model/log_out/log_out_response_dto.dart';

part 'WebServices.g.dart';

@RestApi(baseUrl: 'https://flower.elevateegy.com/')
abstract class WebServices {
  factory WebServices(Dio dio) = _WebServices;

  @GET(ApiConstant.bestSeller)
  Future<BestSellerResponseDto> get();

  @GET(ApiConstant.bestSeller)
  Future<ProductResponseDto> getProduct();
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
  Future<ProductByOccasion> getAllProducts();

  @POST(ApiConstant.cashOrders)
  Future<CreatCashOrderResponse> createCashOrder(
    @Body() PaymentRequest request,
    @Header('Authorization') String token,
  );
  @POST(ApiConstant.checkoutSession)
  Future<CheckoutSessionResponse> checkoutSession(
    @Body() PaymentRequest request,
    @Header('Authorization') String token,
  );
  @GET(ApiConstant.getLoggedUserAddresses)
  Future<GetLoggedUserAddressResponse> loggedUserAddresses(
    @Header('Authorization') String token,
  );

  @PATCH('https://flower.elevateegy.com/api/v1/addresses')
  Future<AddAddressResponseDto> saveaddress(
    @Body() Map<String, dynamic> request,
    @Header("Authorization") String token,
  );
  @GET('${ApiConstant.cart}')
  Future<CartEntity> getCart(@Header("Authorization") String token);
  @DELETE('${ApiConstant.cart}/{id}')
  Future<DeleteItem> deleteCartItem(
    @Path("id") String id,
    @Header("Authorization") String token,
  );
  @POST(ApiConstant.cart)
  Future<CartEntity> cart(
    @Body() CartRequest cartreq,
    @Header("Authorization") String token,
  );
  @GET(ApiConstant.logoutApi)
  Future<LogoutResponseDm> logout(@Header("Authorization") String? token);
  @GET(ApiConstant.getLoggedUserData)
  Future<GetLoggedUserDataResponseDm> getLoggedUserData(@Header("Authorization") String token);

  @PATCH(ApiConstant.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
      @Body() Map<String, dynamic> body,
      @Header("Authorization") String token,
      );
  @PUT(ApiConstant.editProfile)
  Future<EditProfileResponseDto> editProfile(
      @Body() Map<String, dynamic> body,
      @Header('Authorization') String token,
      );
}
