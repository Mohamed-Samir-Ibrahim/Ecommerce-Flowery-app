import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entity/auth_entity/login_entity.dart';
import '../../../domain/entity/auth_entity/login_request_entity.dart';
import '../../model/auth_model/reset_password/reset_password_request.dart';
import '../../model/auth_model/reset_password/reset_password_response.dart';
@Injectable(as: AuthRepositoryContract)

class AuthRepositoryImplementation extends AuthRepositoryContract{
  final AuthRemoteDataSourceContract _authRemoteDataSourceContract;
  AuthRepositoryImplementation(this._authRemoteDataSourceContract);
  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword({required ForgetPasswordRequest email,})async {
    return await _authRemoteDataSourceContract.forgetPassword(email: email);

  }

  @override
  Future<ApiResult<VerifyResetResponse>> verifyReset({required VerifyResetRequest resetCode})async {
    return await _authRemoteDataSourceContract.verifyReset(resetCode: resetCode);

  }
  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword({required ResetPasswordRequest request})async {
    return await _authRemoteDataSourceContract.resetPassword(request: request);
  }
  @override
  Future<ApiResult<SignupEntity>> SignUp({required SignupRequest signup}) async{
   return await _authRemoteDataSourceContract.SignUp(signup: signup);
  }
  @override
  Future<ApiResult<login_response_entity>>login({required login_request_entity request })async{
    return await _authRemoteDataSourceContract.login(request: request );
  }

}