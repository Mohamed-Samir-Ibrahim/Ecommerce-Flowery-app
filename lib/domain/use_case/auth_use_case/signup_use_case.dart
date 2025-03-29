import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/signup/signup_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignUpUseCase{
  final SignupRepository signupRepository;
  SignUpUseCase({required this.signupRepository});
  Future<ApiResult<SignupEntity>>SignUp(String firstName , String lastName , String email,String password,String rePassword ,String phone,String gender){

return signupRepository.SignUp(firstName, lastName, email, password, rePassword, phone, gender);

  }


}