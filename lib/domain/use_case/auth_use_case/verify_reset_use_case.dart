import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetUseCase {
 final AuthRepositoryContract _authRepo;

 VerifyResetUseCase(this._authRepo);

 Future<ApiResult<VerifyResetResponse>> invoke(
      {required VerifyResetRequest resetCode}) async{
    var response = await _authRepo.verifyReset(resetCode:resetCode);
    return response;
  }
}