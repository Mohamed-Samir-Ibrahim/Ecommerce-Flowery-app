import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';

sealed class AuthStates{}
class AuthInitialStates extends AuthStates {

}
class SignUpLoadingState extends AuthStates {

}

class SignUpSuccessState extends AuthStates {
  final SignupEntity signUpResponseEntity;
  SignUpSuccessState({required this.signUpResponseEntity});


}

class SignUpErrorState extends AuthStates {
  final  String? exception;
  SignUpErrorState({required this.exception});

}