import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
 final AuthRepositoryContract _authRepo;

  ForgetPasswordUseCase(this._authRepo);

 Future<ApiResult<ForgetPasswordResponse>> invoke(
      {required ForgetPasswordRequest email}) async{
    var response = await _authRepo.forgetPassword(email: email);
    return response;
  }
}