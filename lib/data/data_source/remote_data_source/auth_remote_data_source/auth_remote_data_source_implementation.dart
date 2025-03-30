import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:injectable/injectable.dart';

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
}
