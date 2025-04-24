// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';

import '../../../../domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';
import '../../../../domain/entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';

enum ProfileStatus { loading, success, error ,}

class ProfileStates extends Equatable {
  final ProfileStatus status;
   LoggedUserDataResponseEntity? obj_user_LoggedUserDataResponse_entity;
   List<SavedAddress_Response_entity>? obj_SavedAddress_Response_entity;
  final EditProfileResponseEntity? obj_EditeProfileResponse_entity;
  final Exception? exception;
  final String? loadingMessage;

  ProfileStates({
    required this.status,
    this.exception,
    this.obj_user_LoggedUserDataResponse_entity,
    this.obj_SavedAddress_Response_entity,
    this.obj_EditeProfileResponse_entity, 
    this.loadingMessage,
  });

  ProfileStates copyWith({
    ProfileStatus? status,
    LoggedUserDataResponseEntity? obj_user_LoggedUserDataResponse_entity,
    List<SavedAddress_Response_entity>? obj_SavedAddress_Response_entity,
   EditProfileResponseEntity? obj_EditeProfileResponse_entity,
    Exception? exception,
    String? loadingMessage,
  }) {
    return ProfileStates(
      status: status ?? this.status,
      obj_user_LoggedUserDataResponse_entity: obj_user_LoggedUserDataResponse_entity ?? this.obj_user_LoggedUserDataResponse_entity,
      obj_SavedAddress_Response_entity: obj_SavedAddress_Response_entity ?? this.obj_SavedAddress_Response_entity,
      obj_EditeProfileResponse_entity: obj_EditeProfileResponse_entity ?? this.obj_EditeProfileResponse_entity,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        loadingMessage,
        obj_user_LoggedUserDataResponse_entity, 
        obj_SavedAddress_Response_entity,
       obj_EditeProfileResponse_entity,
      ];
}
