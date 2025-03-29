// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';
import 'package:flowery/domain/use_case/auth_use_case/forget_password_use_case.dart';
import 'package:flowery/domain/use_case/auth_use_case/login_use_case.dart';
import 'package:flowery/domain/use_case/auth_use_case/verify_reset_use_case.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetUseCase verifyResetUseCase;
  login_use_case obj_login_use_case;


  AuthViewModel(this.forgetPasswordUseCase,this.verifyResetUseCase,this.obj_login_use_case)
      : super(AuthState(status: Status.initial));
  final emailController = TextEditingController();
  final otpCodeController = TextEditingController();
  final emailloginController = TextEditingController();
  final passwordController = TextEditingController();


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

  void login() async {
    emit(state.copyWith(status: Status.loading));
    var result= await obj_login_use_case.invoke(request: login_request_entity(
    email: emailloginController.text.trim(),
    password: passwordController.text.trim()));
    switch(result){
      case Success():{
        emit(state.copyWith(status: Status.success,login:result.data));
         if (result.data?.token != null) {
        await SecureStorageService().saveToken(result.data!.token!);
  print("*******************${result}");      }
      }
      case Error():{
        var e=result.exception;
        emailController.clear();
        emit(state.copyWith(status: Status.error,exception: e));
        print("❌ Login Error: ((((((((($e");
        if (e is DioException) {
           final responseData = e.response?.data;
          final statusCode = e.response?.statusCode;
          print("🚨 DioException Response: $responseData");
          print("🔴 Status Code: $statusCode");
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
        case LoginResetIntent():
        login();
    }
  }



}
sealed class AuthIntent{
}

class ForgetPasswordIntent extends AuthIntent {}
class VerifyResetIntent extends AuthIntent {}
class LoginResetIntent extends AuthIntent{}
