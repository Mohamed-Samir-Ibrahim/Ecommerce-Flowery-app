

import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';

enum Status { initial,loading, success, error ,}

class AuthState extends Equatable{
  Status status;
  ForgetPasswordResponse? forgetPasswordResponse;
  VerifyResetResponse? verifyResetResponse;

  Exception? exception;
  String? loadingMessage;

  AuthState(
      {required this.status,
        this.exception,
        this.loadingMessage,
        this.verifyResetResponse,
        this.forgetPasswordResponse});

  AuthState copyWith({
    Status? status,
    ForgetPasswordResponse? forgetPassword,
    VerifyResetResponse? verifyReset,

    Exception? exception,
    String? loadingMessage,
  }) {
    return AuthState(
        status: status ?? this.status,
verifyResetResponse: verifyReset??verifyResetResponse,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        forgetPasswordResponse: forgetPassword ?? forgetPasswordResponse,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,forgetPasswordResponse,exception,loadingMessage,verifyResetResponse];
}
