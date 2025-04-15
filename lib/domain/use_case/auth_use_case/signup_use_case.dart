import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:injectable/injectable.dart';

import '../../repository_contract/auth_repository_contract/auth_repository_contract.dart';
@injectable
class SignupUseCase{
  final AuthRepositoryContract _authRepo;
  SignupUseCase( this._authRepo);
  Future<ApiResult<SignupEntity>>SignUp({required SignupRequest signUp})async{

   return await  _authRepo.SignUp(signup: signUp);

  }

}