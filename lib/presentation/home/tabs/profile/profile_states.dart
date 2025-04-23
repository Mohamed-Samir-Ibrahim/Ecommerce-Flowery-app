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

  const ProfileState( {required this.status, this.message, this.citiesentity,this.stateentity,this.saveAddress});

ProfileState  copyWith({
  ProfileStates? status,
  String? message,
  Addaddress? saveAddress,
  List<statesentity>?stateentity,

  List<Citiesentity>? citiesentity,
}) {
  return ProfileState(
    saveAddress: saveAddress ?? this.saveAddress,
    stateentity: stateentity ?? this.stateentity,
    status: status ?? this.status,
    message: message ?? this.message,
    citiesentity: citiesentity ?? this.citiesentity,
  );
}

  @override
  // TODO: implement props
  List<Object?> get props =>[status, message, citiesentity,statesentity];


  }