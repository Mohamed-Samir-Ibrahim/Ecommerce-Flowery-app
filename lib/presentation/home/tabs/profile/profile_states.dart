import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/profile_model/CitiesResponseDto.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';

import '../../../../domain/entity/profile_entity/citiesentity.dart';

enum ProfileStates { initial, loading, success, error }

class ProfileState extends Equatable {
  final ProfileStates status;
  final String? message;
  final Addaddress? saveAddress;
  final List<statesentity>?stateentity;
  final List<Citiesentity>? citiesentity;
  LoggedUserDataResponseEntity? obj_user_LoggedUserDataResponse_entity;
  List<SavedAddress_Response_entity>? obj_SavedAddress_Response_entity;
  final EditProfileResponseEntity? obj_EditeProfileResponse_entity;
  const ProfileState( {required this.status, this.message, this.citiesentity,this.stateentity,this.saveAddress
  this.obj_user_LoggedUserDataResponse_entity,
    this.obj_SavedAddress_Response_entity,
    this.obj_EditeProfileResponse_entity,
  });

ProfileState  copyWith({
  ProfileStates? status,
  String? message,
  Addaddress? saveAddress,
  List<statesentity>?stateentity,
  List<Citiesentity>? citiesentity,
  LoggedUserDataResponseEntity? obj_user_LoggedUserDataResponse_entity,
  List<SavedAddress_Response_entity>? obj_SavedAddress_Response_entity,
  EditProfileResponseEntity? obj_EditeProfileResponse_entity,

}) {
  return ProfileState(
    saveAddress: saveAddress ?? this.saveAddress,
    stateentity: stateentity ?? this.stateentity,
    obj_user_LoggedUserDataResponse_entity: obj_user_LoggedUserDataResponse_entity ?? this.obj_user_LoggedUserDataResponse_entity,
    obj_SavedAddress_Response_entity: obj_SavedAddress_Response_entity ?? this.obj_SavedAddress_Response_entity,
    obj_EditeProfileResponse_entity: obj_EditeProfileResponse_entity ?? this.obj_EditeProfileResponse_entity,
    status: status ?? this.status,
    message: message ?? this.message,
    citiesentity: citiesentity ?? this.citiesentity,
  );
}

  @override
  // TODO: implement props
  List<Object?> get props =>[status, message, citiesentity,statesentity,
    obj_user_LoggedUserDataResponse_entity,
    obj_SavedAddress_Response_entity,
    obj_EditeProfileResponse_entity,];


  }