import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/profile_model/CitiesResponseDto.dart';
import 'package:flowery/data/model/profile_model/log_out/log_out_response_dto.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import 'package:flowery/domain/entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';

import '../../../../domain/entity/profile_entity/change_password/change_password.dart';
import '../../../../domain/entity/profile_entity/citiesentity.dart';

enum ProfileStates { initial, loading, success, error }

class ProfileState extends Equatable {
  final ProfileStates status;
  final String? message;
  final Addaddress? saveAddress;
  final List<statesentity>?stateentity;
  final List<Citiesentity>? citiesentity;
 final GetLoggedUserDataEntity? getLoggedUserDataEntity;
  final EditProfileEntity? editProfileEntity;
  final ChangePasswordEntity? changePasswordEntity;
  final LogoutResponseDm? logOutResponse;
  const ProfileState( {required this.status, this.message, this.citiesentity,this.stateentity,this.saveAddress
  ,this.getLoggedUserDataEntity,this.editProfileEntity,this.changePasswordEntity,
  this.logOutResponse});

ProfileState  copyWith({
  ProfileStates? status,
  String? message,
  Addaddress? saveAddress,
  List<statesentity>?stateentity,
  GetLoggedUserDataEntity? getLoggedUserDataEntity,
  EditProfileEntity? editProfileEntity,
  ChangePasswordEntity? changePasswordEntity,
  LogoutResponseDm? logOutResponse,
  List<Citiesentity>? citiesentity,
}) {
  return ProfileState(
    saveAddress: saveAddress ?? this.saveAddress,
    stateentity: stateentity ?? this.stateentity,
    status: status ?? this.status,
    message: message ?? this.message,
    citiesentity: citiesentity ?? this.citiesentity,
    getLoggedUserDataEntity: getLoggedUserDataEntity ?? this.getLoggedUserDataEntity,
    editProfileEntity: editProfileEntity ?? this.editProfileEntity,
    changePasswordEntity: changePasswordEntity ?? this.changePasswordEntity,
    logOutResponse: logOutResponse ?? this.logOutResponse
  );
}

  @override
  // TODO: implement props
  List<Object?> get props =>[status, message, citiesentity,statesentity,
  saveAddress,getLoggedUserDataEntity,editProfileEntity,changePasswordEntity,logOutResponse];


  }