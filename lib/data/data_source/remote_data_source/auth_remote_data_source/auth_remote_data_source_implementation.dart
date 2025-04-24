import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/model/Profile/logout/Logout_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/data/model/auth_model/reset_password/reset_password_request.dart';
import 'package:flowery/data/model/auth_model/reset_password/reset_password_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entity/auth_entity/login_response_entity.dart';
import '../../../../domain/entity/auth_entity/login_request_entity.dart';

@Injectable(as: AuthRemoteDataSourceContract)
class AuthRemoteDataSourceImplementation
    implements AuthRemoteDataSourceContract {
  WebServices client;

  AuthRemoteDataSourceImplementation(this.client);

  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword({
    required ForgetPasswordRequest email,
  }) async {
    return executeApi<ForgetPasswordResponse>(() async {
      var response = await client.forgetPaswword(email);

      return response;
    });
  }
  @override
  Future<ApiResult<VerifyResetResponse>> verifyReset({
    required VerifyResetRequest resetCode,
  }) async {
    return executeApi<VerifyResetResponse>(() async {
      var response = await client.verifyReset(resetCode);

      return response;
    });
  }

  @override
  Future<ApiResult<SignupResponseDto>> SignUp({required SignupRequest signup}) async{
    return executeApi<SignupResponseDto>(() async {
      var response = await client.Signup(signup.tojson());

      return response;
    });
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword({
  required ResetPasswordRequest request,
  }) async {
    return executeApi<ResetPasswordResponse>(() async {
      var response = await client.resetPassword(
        ResetPasswordRequest(
          email: request.email,
          newPassword: request.newPassword,)
      );
      return response;
    });
  }
   @override
  Future<ApiResult<login_response_entity>> login({
    required login_request_entity request})  async{
    return executeApi<login_response_entity>(() async {
      var response_login = await client.login(request);
      return  response_login;
    });
  }

  @override
Future<ApiResult<Logout_response_DM>> logout() async {
  return executeApi<Logout_response_DM>(() async {
    final token = await SecureStorageService().getToken(); 
    var response_logout = await client.logout('Bearer $token');
    return Logout_response_DM(message: "success");
  });
}



}


