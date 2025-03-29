

// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/domain/entity/auth_entity/login_entity.dart';

enum Status { initial,loading, success, error ,}

class AuthState extends Equatable{
  Status status;
  ForgetPasswordResponse? forgetPasswordResponse;
  VerifyResetResponse? verifyResetResponse;
  login_response_entity? obj_login_response;

  Exception? exception;
  String? loadingMessage;

  AuthState(
      {required this.status,
        this.exception,
        this.loadingMessage,
        this.verifyResetResponse,
        this.forgetPasswordResponse,
        this.obj_login_response,});

  AuthState copyWith({
    Status? status,
    ForgetPasswordResponse? forgetPassword,
    VerifyResetResponse? verifyReset,
    login_response_entity? login,
    Exception? exception,
    String? loadingMessage,
  }) {
    return AuthState(
        status: status ?? this.status,
verifyResetResponse: verifyReset??verifyResetResponse,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        forgetPasswordResponse: forgetPassword ?? forgetPasswordResponse,
        obj_login_response: login??obj_login_response,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,forgetPasswordResponse,exception,loadingMessage,verifyResetResponse,obj_login_response];
}
