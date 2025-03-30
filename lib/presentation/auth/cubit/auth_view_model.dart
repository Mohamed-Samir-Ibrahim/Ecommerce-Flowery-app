import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/auth_use_case/forget_password_use_case.dart';
import 'package:flowery/domain/use_case/auth_use_case/signup_use_case.dart';
import 'package:flowery/domain/use_case/auth_use_case/verify_reset_use_case.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetUseCase verifyResetUseCase;
  SignupUseCase signupUseCase;

  AuthViewModel(this.forgetPasswordUseCase,this.verifyResetUseCase,this.signupUseCase)
      : super(AuthState(status: Status.initial));
  final emailController = TextEditingController();
  final otpCodeController = TextEditingController();
  TextEditingController fristName = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  String SelectedGender = 'female';

  void _forgetPassword() async {

    emit(state.copyWith(status: Status.loading));

    var result= await forgetPasswordUseCase.invoke(email: ForgetPasswordRequest(email: emailController.text));
    switch(result){
      case Success():{

        emit(state.copyWith(status: Status.success,forgetPassword:result.data));
      }
      case Error():{
        var e=result.exception;

        emailController.clear();

        emit(state.copyWith(status: Status.error,exception: e));
      }
    }


  }

  void SignUp() async {
    emit(state.copyWith(status: Status.loading));
    var result = await signupUseCase.SignUp(signUp: SignupRequest(fristName: fristName.text, LastName:lastname.text, Phone: phone.text, email: email.text, Password: password.text, RePassword: rePassword.text, gender: SelectedGender));
    switch (result) {
      case Success():
        {

          emit(state.copyWith(status: Status.success,signup: result.data));

// if(result.data?.message=='success') {
// }else {
// emit(SignUpErrorState(exception: result.data!.error??"ErrorMsg"));
//
// }
        }
      case Error():
        {

          emit(state.copyWith(
              status: Status.error, exception:result.exception ));
        }
    }
  }
  void _verifyReset() async {

    emit(state.copyWith(status: Status.loading));

    var result= await verifyResetUseCase.invoke(resetCode: VerifyResetRequest(resetCode: otpCodeController.text));
    switch(result){
      case Success():{
        emit(state.copyWith(status: Status.success,verifyReset:result.data));
      }
      case Error():{
        otpCodeController.clear();

        var e=result.exception;
        emit(state.copyWith(status: Status.error,exception: e));

      }
    }


  }


  void doIntent(AuthIntent authIntent){
    switch(authIntent){
      case ForgetPasswordIntent():
        _forgetPassword();
      case VerifyResetIntent():
        _verifyReset();
      case SignupIntent():
        SignUp();
    }
  }



}
sealed class AuthIntent{
}

class ForgetPasswordIntent extends AuthIntent {}
class VerifyResetIntent extends AuthIntent {}
class SignupIntent extends AuthIntent{}