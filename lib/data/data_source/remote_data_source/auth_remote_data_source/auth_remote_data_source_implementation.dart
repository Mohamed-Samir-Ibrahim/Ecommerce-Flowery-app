// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member

import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/login_entity.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';
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
  Future<ApiResult<login_response_entity>> login({
    required login_request_entity request})  async{ 
    return executeApi<login_response_entity>(() async {
      var response_login = await client.login(request);
      return  response_login;
    });
  }


}

  
