// ignore_for_file: camel_case_types

import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/login_entity.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';

abstract  class AuthRemoteDataSourceContract {
  Future<ApiResult<ForgetPasswordResponse>>forgetPassword({required ForgetPasswordRequest email});
  Future<ApiResult<VerifyResetResponse>>verifyReset({required VerifyResetRequest resetCode});
   Future<ApiResult<login_response_entity>> login({required login_request_entity request}); 
}

