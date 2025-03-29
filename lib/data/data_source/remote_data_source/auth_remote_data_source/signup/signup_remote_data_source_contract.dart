import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';

abstract class SignupRemoteDataSourceContract{
Future<ApiResult<SignupEntity>>signup(String firstName , String lastName , String email,String password,String rePassword ,String phone,String gender);


}