import 'package:dio/dio.dart';
import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/use_case/profile_use_case/cities_use_case.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared_Preferences.dart';
import '../../../../domain/common/api_result.dart';
import '../../../../domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';
import '../../../../domain/use_case/Profile_use_case/getuserdata_usecase.dart';
import '../../../../domain/use_case/Profile_use_case/saved_adress_use_case.dart';
@singleton
class ProfileViewModel extends Cubit<ProfileState> {
  final GetLoggedUserUseCase obj_GetLoggedUserUseCase;
  final saved_adress_use_case obj_saved_adress_use_case;
  var token = SecureStorageService().getToken();
  cities_use_case cities;
TextEditingController street=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController lat=TextEditingController();
TextEditingController long=TextEditingController();
  TextEditingController username=TextEditingController();
  String? selectedCity ;


  ProfileViewModel(this.cities, this.obj_GetLoggedUserUseCase, this.obj_saved_adress_use_case):super(ProfileState(status: ProfileStates.initial));



   getCities()async{

    emit(state.copyWith(status: ProfileStates.loading));

    var response= await cities.get();


    switch(response){

  case Success():{

    emit(state.copyWith(status: ProfileStates.success,citiesentity: response.data));
    await Getstates();
  }

  case Error():{
    var e=response.exception;

    emit(state.copyWith(status: ProfileStates.error,message: e.toString()));

  }
}

  }
   Getstates()async{
    emit(state.copyWith(status: ProfileStates.loading));
    var response=await cities.getstates();
    switch(response){
      case Success():{
        emit(state.copyWith(status: ProfileStates.success,stateentity: response.data));
      }
      case Error():{
        var e=response.exception;
        emit(state.copyWith(status: ProfileStates.error,message: e.toString()));
      }

    }

  }

   SaveAddress()async{
    emit(state.copyWith(status: ProfileStates.loading));
   var response = await cities.SaveAddress(AddAddressRequest(street: street.text, city: selectedCity??'', phone: phone.text, lat: 'sad', long: 'dsa', username: username.text));
    switch(response){

      case Success():{
        emit(state.copyWith(status: ProfileStates.success,saveAddress: response.data));
      }
      case Error():{
        var e=response.exception;
        emit(state.copyWith(status: ProfileStates.error,message: e.toString()));
      }
    }

  }
  List<String> dynamicTabs = ['All'];
  List<SavedAddress_Response_entity> savedAddressList = [];

  void getloggeduserdata() async {
    emit(state.copyWith(status: ProfileStates.loading));

    var result = await obj_GetLoggedUserUseCase.invoke(token:'Bearer $token');
    switch (result) {
      case Success():
        {

          emit(state.copyWith(status:ProfileStates.success,obj_user_LoggedUserDataResponse_entity: result.data));
          print("✅ user data State: ${state.status}, Data: ${result.data}");


        }
      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: ProfileStates.error, message: e.toString()));
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
    emit(state.copyWith(status: ProfileStates.loading));

    var result = await obj_saved_adress_use_case.invoke(token: 'Bearer $token');
    switch (result) {
      case Success():
        {
          emit(state.copyWith(status:ProfileStates.success,obj_SavedAddress_Response_entity: savedAddressList??[]));
        }

      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: ProfileStates.error, message: e.toString()));
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













 dointent(ProfileIntent profileIntent) {
  switch(profileIntent){
    case GetCitiesIntent():{
      getCities();
    }
    case GetstatesIntent():{
      Getstates();
    }

    case SaveAddressIntent():{
      SaveAddress();

    }

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
sealed class ProfileIntent{}

class GetCitiesIntent extends ProfileIntent{}
class GetstatesIntent extends ProfileIntent{}
class SaveAddressIntent extends ProfileIntent{}
class loggeduserdata extends ProfileIntent {

  loggeduserdata();
}
class savesaddress extends ProfileIntent {
  final String token;
  savesaddress({required this.token});
}