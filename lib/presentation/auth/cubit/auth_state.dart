

import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:flowery/domain/entity/error_model.dart';

import '../../../data/model/auth_model/reset_password/reset_password_response.dart';
import '../../../domain/entity/auth_entity/login_entity.dart';

enum Status { initial,loading, success, error ,}

class AuthState extends Equatable{
  Status status;
  ForgetPasswordResponse? forgetPasswordResponse;
  VerifyResetResponse? verifyResetResponse;
  SignupEntity?signupResponseDto;
  ResetPasswordResponse? resetPasswordResponse;
  login_response_entity? obj_login_response;
  Exception? exception;
  String? loadingMessage;

  AuthState(
      {required this.status,
        this.exception,
        this.signupResponseDto,
        this.loadingMessage,
        this.verifyResetResponse,
        this.forgetPasswordResponse,
        this.resetPasswordResponse,
        this.obj_login_response,});

  AuthState copyWith({
    Status? status,
    ForgetPasswordResponse? forgetPassword,
    VerifyResetResponse? verifyReset,
    SignupEntity? signup,
    login_response_entity? login,
    ResetPasswordResponse? resetPassword,
    Exception? exception,
    String? loadingMessage,
  }) {
    return AuthState(
        status: status ?? this.status,
verifyResetResponse: verifyReset??verifyResetResponse,
        obj_login_response: login??obj_login_response,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        forgetPasswordResponse: forgetPassword ?? forgetPasswordResponse,
        signupResponseDto: signup??signup,
        resetPasswordResponse: resetPassword ?? resetPasswordResponse,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,forgetPasswordResponse,exception,loadingMessage,verifyResetResponse,signupResponseDto,resetPasswordResponse,obj_login_response];

}
