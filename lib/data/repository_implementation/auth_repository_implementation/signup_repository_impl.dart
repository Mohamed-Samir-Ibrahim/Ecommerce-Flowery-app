import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/signup/signup_remote_data_source_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/signup/signup_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:SignupRepository )
class SignUpRepositoryImpl implements SignupRepository{
  SignupRemoteDataSourceContract signupRemoteDataSourceContract;
  SignUpRepositoryImpl({required this.signupRemoteDataSourceContract});
  @override
  Future<ApiResult<SignupEntity>> SignUp(String firstName , String lastName , String email,String password,String rePassword ,String phone,String gender) {


  return signupRemoteDataSourceContract.signup(firstName, lastName, email, password, rePassword, phone, gender);




  }


}