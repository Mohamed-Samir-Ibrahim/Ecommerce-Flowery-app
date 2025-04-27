import 'package:flowery/data/model/profile_model/addAddressRequest.dart';

import 'package:flowery/domain/use_case/profile_use_case/change_password.dart';
import 'package:flowery/domain/use_case/profile_use_case/cities_use_case.dart';
import 'package:flowery/domain/use_case/profile_use_case/edit_profile.dart';
import 'package:flowery/domain/use_case/profile_use_case/get_logged_user.dart';
import 'package:flowery/domain/use_case/profile_use_case/log_out.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/shared_Preferences.dart';
import '../../../../data/model/profile_model/change_password/change_password_request_dto.dart';
import '../../../../data/model/profile_model/edit_profile/edit_profile_request_dto.dart';
import '../../../../domain/common/api_result.dart';
@singleton
class ProfileViewModel extends Cubit<ProfileState> {
  cities_use_case cities;
  LogOutUseCase logOutUseCase;
  GetLoggedUserUseCase getLoggedUserUseCase;
EditProfileUseCase editProfileUseCase;
ChangePasswordUseCase changePasswordUseCase;
TextEditingController emailController=TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
TextEditingController street=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController lat=TextEditingController();
TextEditingController long=TextEditingController();
  TextEditingController username=TextEditingController();
  String? selectedGender ;
  String? selectedCity ;

  ProfileViewModel(this.cities,this.logOutUseCase,this.getLoggedUserUseCase,this.editProfileUseCase,this.changePasswordUseCase):super(ProfileState(status: ProfileStates.initial));


 logOut()async{
   var token= await SecureStorageService().getToken();
   emit(state.copyWith(status: ProfileStates.loading));
   var response=await logOutUseCase.invoke('Bearer $token');
   switch(response){
     case Success():{
       emit(state.copyWith(status: ProfileStates.success));
       await SecureStorageService().deleteToken();
     }
     case Error():{
       var e=response.exception;
       emit(state.copyWith(status: ProfileStates.error,message: e.toString()));
     }
   }
 }
 changePassword()async{
   emit(state.copyWith(status: ProfileStates.loading));
   var response=await changePasswordUseCase.invoke(ChangePasswordRequestDto(password: passwordController.text,newPassword: newPasswordController.text));
   switch(response){
     case Success():{
       emit(state.copyWith(status: ProfileStates.success,changePasswordEntity: response.data));

     }
     case Error():{
       var e=response.exception;
       emit(state.copyWith(status: ProfileStates.error,message: e.toString()));
     }
   }
 }
 editProfile()async{
   emit(state.copyWith(status: ProfileStates.loading));
   var response=await editProfileUseCase.editProfile(EditProfileRequestDto(
       firstName: firstNameController.text, lastName: lastNameController.text, email: emailController.text,
       phone: phoneController.text,
       password: passwordController.text,
      gender: selectedGender,
      ));
   switch(response){
     case Success():{
       emit(state.copyWith(status: ProfileStates.success,editProfileEntity: response.data));
     }
     case Error():{
       var e=response.exception;
       emit(state.copyWith(status: ProfileStates.error,message: e.toString()));
     }
   }
 }
 getLoggedUser()async{
   emit(state.copyWith(status: ProfileStates.loading));
   var token= await SecureStorageService().getToken();
   var response=await getLoggedUserUseCase.invoke(
       'Bearer $token'
   );

   switch(response){
     case Success():{
       emit(state.copyWith(status: ProfileStates.success,getLoggedUserDataEntity: response.data));
     }
     case Error():{
       var e=response.exception;
       emit(state.copyWith(status: ProfileStates.error,message: e.toString()));
     }
   }
 }
   getCities()async{

    emit(state.copyWith(status: ProfileStates.loading));

    var response= await cities.get();


    switch(response){

  case Success():{

    emit(state.copyWith(status: ProfileStates.success,citiesentity: response.data));
    await getStates();
  }

  case Error():{
    var e=response.exception;

    emit(state.copyWith(status: ProfileStates.error,message: e.toString()));

  }
}

  }
   getStates()async{
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

   saveAddress()async{
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

 doIntent(ProfileIntent profileIntent) {
  switch(profileIntent){
    case GetCitiesIntent():{
      getCities();
    }
    case GetStatesIntent():{
      getStates();
    }

    case SaveAddressIntent():{
      saveAddress();

    }

    case LogOutIntent():{
      logOut();
    }
    case ChangePasswordIntent():{
      changePassword();
    }
    case EditProfileIntent():{
      editProfile();
    }
    case GetLoggedUserIntent():{
      getLoggedUser();
    }

}


}

}
sealed class ProfileIntent{}

class GetCitiesIntent extends ProfileIntent{}
class GetStatesIntent extends ProfileIntent{}
class SaveAddressIntent extends ProfileIntent{}
class LogOutIntent extends ProfileIntent{}
class ChangePasswordIntent extends ProfileIntent{}
class EditProfileIntent extends ProfileIntent{}
class GetLoggedUserIntent extends ProfileIntent{}