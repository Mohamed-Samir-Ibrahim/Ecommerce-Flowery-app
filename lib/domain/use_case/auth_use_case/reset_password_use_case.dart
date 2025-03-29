import 'package:flowery/data/model/auth_model/reset_password/reset_password_response.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/auth_model/reset_password/reset_password_request.dart';
import '../../common/api_result.dart';
@injectable
class ResetPasswordUseCase{
  final AuthRepositoryContract _authRepositoryContract;

  ResetPasswordUseCase(this._authRepositoryContract);

  Future<ApiResult<ResetPasswordResponse>> invoke({
    required ResetPasswordRequest request
  }) async {
    return await _authRepositoryContract.resetPassword(
   request: request,
    );
  }
}