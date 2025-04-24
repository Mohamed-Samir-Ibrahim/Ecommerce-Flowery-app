// ignore_for_file: unused_local_variable, unused_element

import 'package:dio/dio.dart';
import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';
import 'package:flowery/domain/use_case/Profile_use_case/getuserdata_usecase.dart';
import 'package:flowery/domain/use_case/Profile_use_case/saved_adress_use_case.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';


@injectable
class Profileviewmodel extends Cubit<ProfileStates> {
  final GetLoggedUserUseCase obj_GetLoggedUserUseCase;
  final saved_adress_use_case obj_saved_adress_use_case;
   var token = SecureStorageService().getToken();

  Profileviewmodel(this.obj_GetLoggedUserUseCase,this.obj_saved_adress_use_case)
    : super(ProfileStates(status: ProfileStatus.success));

  List<String> dynamicTabs = ['All'];
  List<SavedAddress_Response_entity> savedAddressList = [];

  void getloggeduserdata() async {
    emit(state.copyWith(status: ProfileStatus.loading));

    var result = await obj_GetLoggedUserUseCase.invoke(token:'Bearer $token');
    switch (result) {
      case Success():
        { 

        emit(state.copyWith(status:ProfileStatus.success,obj_user_LoggedUserDataResponse_entity: result.data));
          print("✅ user data State: ${state.status}, Data: ${result.data}");


        }
      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: ProfileStatus.error, exception: e));
          print("❌ user Data Fetch Error: $e");

          if (e is DioException) {
            final responseData = e.response?.data;
            final statusCode = e.response?.statusCode;
            print("🛑 DioException Response: $responseData");
            print("📛 Status Code: $statusCode");
          } else {
            print("🛑 Non-Dio Exception: ${e.toString()}");
          }
        }
  }
}



void getsavedaddress() async {
    emit(state.copyWith(status: ProfileStatus.loading));

    var result = await obj_saved_adress_use_case.invoke(token: 'Bearer $token');
    switch (result) {
      case Success():
        { 
          emit(state.copyWith(status:ProfileStatus.success,obj_SavedAddress_Response_entity: savedAddressList??[]));
        }

      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: ProfileStatus.error, exception: e));
          print("❌ user Data Fetch Error: $e");

          if (e is DioException) {
            final responseData = e.response?.data;
            final statusCode = e.response?.statusCode;
            print("🛑 DioException Response: $responseData");
            print("📛 Status Code: $statusCode");
          } else {
            print("🛑 Non-Dio Exception: ${e.toString()}");
          }
        }
  }
}







  

  
  void doIntent(profileIntent objprofileIntent) {
    switch (objprofileIntent) {
      case loggeduserdata():
        {
          getloggeduserdata();
          break;
      
        }
        case savesaddress():
        {
          getsavedaddress();
          break;
        }
   
    
    }
  }
}

sealed class profileIntent {}
class loggeduserdata extends profileIntent {

  loggeduserdata();
}
class savesaddress extends profileIntent {
  final String token;
  savesaddress({required this.token});
}
