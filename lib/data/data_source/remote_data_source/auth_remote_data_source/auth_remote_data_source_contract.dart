import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';

import '../../../model/auth_model/reset_password/reset_password_request.dart';
import '../../../model/auth_model/reset_password/reset_password_response.dart';

abstract  class AuthRemoteDataSourceContract {
  Future<ApiResult<ForgetPasswordResponse>>forgetPassword({required ForgetPasswordRequest email});
  Future<ApiResult<VerifyResetResponse>>verifyReset({required VerifyResetRequest resetCode});

  Future<ApiResult<ResetPasswordResponse>> resetPassword({
    required ResetPasswordRequest request,
  });
}