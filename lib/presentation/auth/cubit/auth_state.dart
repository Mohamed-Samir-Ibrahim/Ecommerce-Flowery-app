

import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';

enum Status { initial,loading, success, error ,}

class AuthState extends Equatable{
  Status status;
  ForgetPasswordResponse? forgetPasswordResponse;
  VerifyResetResponse? verifyResetResponse;
  SignupEntity?signupResponseDto;
  Exception? exception;
  String? loadingMessage;

  AuthState(
      {required this.status,
        this.exception,
        this.signupResponseDto,
        this.loadingMessage,
        this.verifyResetResponse,
        this.forgetPasswordResponse});

  AuthState copyWith({
    Status? status,
    ForgetPasswordResponse? forgetPassword,
    VerifyResetResponse? verifyReset,
    SignupEntity? signup,
    Exception? exception,
    String? loadingMessage,
  }) {
    return AuthState(
        status: status ?? this.status,
verifyResetResponse: verifyReset??verifyResetResponse,

        loadingMessage: loadingMessage ?? this.loadingMessage,
        forgetPasswordResponse: forgetPassword ?? forgetPasswordResponse,
        signupResponseDto: signup??signup,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,forgetPasswordResponse,exception,loadingMessage,verifyResetResponse,signupResponseDto];
}
