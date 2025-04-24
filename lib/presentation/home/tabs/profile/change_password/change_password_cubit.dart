import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/data/model/Profile/change_password/change_password_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/Profile_use_case/change_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'change_password_state.dart';

@singleton
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase useCase;

  ChangePasswordCubit(this.useCase)
      : super(ChangePasswordState(status: ChangePasswordStatus.initial));

  Future<void> changePassword() async {
    final passwordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final token = await SecureStorageService().getToken();
    emit(state.copyWith(status: ChangePasswordStatus.loading));
    final response = await useCase.call(
      changePasswordRequest: ChangePasswordRequest(password: passwordController.text, newPassword: newPasswordController.text)
    );
    
    switch(response){
      case Success():{
        var res =  response.data;
        //emit(state.copyWith(status: ChangePasswordStatus.success,entity: res));
      }
      case Error():{
        var e=response.exception;
          emit(state.copyWith(status: ChangePasswordStatus.error,exception: e));

      }

    }
  }
}