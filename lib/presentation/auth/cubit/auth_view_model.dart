import 'package:dio/dio.dart';
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
import '../../../core/shared_Preferences.dart';
import '../../../data/model/auth_model/reset_password/reset_password_request.dart';
import '../../../domain/entity/auth_entity/login_request_entity.dart';
import '../../../domain/use_case/auth_use_case/login_use_case.dart';
import '../../../domain/use_case/auth_use_case/reset_password_use_case.dart';
@singleton
class AuthViewModel extends Cubit<AuthState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetUseCase verifyResetUseCase;
  SignupUseCase signupUseCase;
  ResetPasswordUseCase resetPasswordUseCase ;
  login_use_case objLoginUseCase;
  AuthViewModel(this.forgetPasswordUseCase,this.verifyResetUseCase,this.objLoginUseCase,this.resetPasswordUseCase,this.signupUseCase)
      : super(AuthState(status: Status.initial));
   bool isChecked = false;
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpCodeController = TextEditingController();
  final emailloginController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  String selectedGender = 'female';

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

  void signup() async {
    emit(state.copyWith(status: Status.loading));
    var result = await signupUseCase.SignUp(signUp: SignupRequest(fristName: firstName.text, LastName:lastname.text, Phone: phone.text, email: email.text, Password: password.text, RePassword: rePassword.text, gender: selectedGender));
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
        emit(state.copyWith(status: Status.error,exception: result.exception));

      }
    }


  }
  void _resetPassword() async {

    emit(state.copyWith(status: Status.loading));

    var result = await resetPasswordUseCase.invoke(
      request: ResetPasswordRequest(email: emailController.text, newPassword: newPasswordController.text),
    );

    switch (result) {
      case Success():

        emit(state.copyWith(status: Status.success, resetPassword: result.data));
        break;

      case Error():

        emit(state.copyWith(status: Status.error, exception: result.exception));
        break;
    }
  }

  void login() async {
    emit(state.copyWith(status: Status.loading));
    var result= await objLoginUseCase.invoke(request: login_request_entity(
        email: emailloginController.text.trim(),
        password: passwordController.text.trim()));
    switch(result){
      case Success():{
        emit(state.copyWith(status: Status.success,login:result.data));
        if (result.data?.token != null) {
          await SecureStorageService().saveToken(result.data!.token!);}

      }
      case Error():{
        var e=result.exception;
        emailController.clear();
        emit(state.copyWith(status: Status.error,exception: e));

        if (e is DioException) {
          final responseData = e.response?.data;
          final statusCode = e.response?.statusCode;
        }
      }
    }
  }


  void doIntent(AuthIntent authIntent){
    switch(authIntent){
      case ForgetPasswordIntent():
        _forgetPassword();
      case VerifyResetIntent():
        _verifyReset();
        case ResetPasswordIntent():
        _resetPassword();
      case SignupIntent():
        signup();
      case LoginResetIntent():
        login();
    }
  }



}
sealed class AuthIntent{
}

class ForgetPasswordIntent extends AuthIntent {}
class VerifyResetIntent extends AuthIntent {}
class ResetPasswordIntent extends AuthIntent {}
class LoginResetIntent extends AuthIntent{}
class SignupIntent extends AuthIntent{}