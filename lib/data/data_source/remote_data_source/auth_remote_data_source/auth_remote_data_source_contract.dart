import 'package:flowery/data/model/Profile/logout/Logout_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';

import '../../../../domain/entity/auth_entity/login_response_entity.dart';
import '../../../../domain/entity/auth_entity/login_request_entity.dart';
import '../../../model/auth_model/reset_password/reset_password_request.dart';
import '../../../model/auth_model/reset_password/reset_password_response.dart';

abstract  class AuthRemoteDataSourceContract {
  Future<ApiResult<ForgetPasswordResponse>>forgetPassword({required ForgetPasswordRequest email});
  Future<ApiResult<VerifyResetResponse>>verifyReset({required VerifyResetRequest resetCode});
  Future<ApiResult<SignupEntity>>SignUp({required SignupRequest signup});
  Future<ApiResult<login_response_entity>> login({required login_request_entity request});
  Future<ApiResult<Logout_response_DM>> logout();
  Future<ApiResult<ResetPasswordResponse>> resetPassword({required ResetPasswordRequest request});
}