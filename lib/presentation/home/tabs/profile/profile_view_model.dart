import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flowery/domain/use_case/profile_use_case/cities_use_case.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/common/api_result.dart';
@singleton
class ProfileViewModel extends Cubit<ProfileState> {
  cities_use_case cities;
TextEditingController street=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController lat=TextEditingController();
TextEditingController long=TextEditingController();
  TextEditingController username=TextEditingController();
  String? selectedCity ;


  ProfileViewModel(this.cities):super(ProfileState(status: ProfileStates.initial));



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

}


}

}
sealed class ProfileIntent{}

class GetCitiesIntent extends ProfileIntent{}
class GetstatesIntent extends ProfileIntent{}
class SaveAddressIntent extends ProfileIntent{}