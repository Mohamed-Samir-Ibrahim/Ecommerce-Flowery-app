import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/auth_use_case/forget_password_use_case.dart';
import 'package:flowery/domain/use_case/auth_use_case/verify_reset_use_case.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/auth_model/reset_password/reset_password_request.dart';
import '../../../domain/use_case/auth_use_case/reset_password_use_case.dart';

@injectable
class AuthViewModel extends Cubit<AuthState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyResetUseCase verifyResetUseCase;
  ResetPasswordUseCase resetPasswordUseCase ;


  AuthViewModel(this.forgetPasswordUseCase,this.verifyResetUseCase,this.resetPasswordUseCase)
      : super(AuthState(status: Status.initial));
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpCodeController = TextEditingController();


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
  void _resetPassword() async {
    if (!formKey.currentState!.validate()) return;

    emit(state.copyWith(status: Status.loading));
    print("🔄 Sending reset password request...");

    var result = await resetPasswordUseCase.invoke(
      request: ResetPasswordRequest(email: emailController.text, newPassword: newPasswordController.text),
    );

    switch (result) {
      case Success():
        print("✅ Success: ${result.data}");
        emit(state.copyWith(status: Status.success, resetPassword: result.data));
        break;

      case Error():
        print("❌ Error: ${result.exception}");
        emit(state.copyWith(status: Status.error, exception: result.exception));
        break;
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
    }
  }



}
sealed class AuthIntent{
}

class ForgetPasswordIntent extends AuthIntent {}
class VerifyResetIntent extends AuthIntent {}
class ResetPasswordIntent extends AuthIntent {}
