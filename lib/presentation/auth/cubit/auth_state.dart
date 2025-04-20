import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/domain/entity/Profile_entity/logout_entity.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:flowery/data/model/auth_model/reset_password/reset_password_response.dart';
import 'package:flowery/domain/entity/auth_entity/login_response_entity.dart';

enum Status { initial, loading, success, error }

class AuthState extends Equatable {
  final Status status;
  final ForgetPasswordResponse? forgetPasswordResponse;
  final VerifyResetResponse? verifyResetResponse;
  final SignupEntity? signupResponseDto;
  final ResetPasswordResponse? resetPasswordResponse;
  final login_response_entity? obj_login_response;
  final logout_response_entity? obj_logout_response;
  final Exception? exception;
  final String? loadingMessage;

  AuthState({
    required this.status,
    this.exception,
    this.signupResponseDto,
    this.loadingMessage,
    this.verifyResetResponse,
    this.forgetPasswordResponse,
    this.resetPasswordResponse,
    this.obj_login_response,
    this.obj_logout_response,
  });

  AuthState copyWith({
    Status? status,
    ForgetPasswordResponse? forgetPassword,
    VerifyResetResponse? verifyReset,
    SignupEntity? signup,
    login_response_entity? login,
    logout_response_entity? logout,
    ResetPasswordResponse? resetPassword,
    Exception? exception,
    String? loadingMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      verifyResetResponse: verifyReset ?? this.verifyResetResponse,
      obj_login_response: login ?? this.obj_login_response,
      obj_logout_response: logout ?? this.obj_logout_response,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      forgetPasswordResponse: forgetPassword ?? this.forgetPasswordResponse,
      signupResponseDto: signup ?? this.signupResponseDto,
      resetPasswordResponse: resetPassword ?? this.resetPasswordResponse,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        forgetPasswordResponse,
        exception,
        loadingMessage,
        verifyResetResponse,
        signupResponseDto,
        resetPasswordResponse,
        obj_login_response,
        obj_logout_response,
      ];
}
