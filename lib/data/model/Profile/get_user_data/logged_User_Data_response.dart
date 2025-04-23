// ignore_for_file: camel_case_types

import 'package:flowery/domain/entity/Profile_entity/get_user_data_entity/logged_user_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logged_User_Data_response.g.dart';
@JsonSerializable()
class GetLoggedUserDataResponseDm extends LoggedUserDataResponse_entity {

  GetLoggedUserDataResponseDm({
      super.message,super.userdata,});
}

@JsonSerializable()
class UserGetLoggedUserDataResponseDm extends user_LoggedUserDataResponse_entity {
  UserGetLoggedUserDataResponseDm({
      super.id, 
      super.firstName, 
      super.lastName, 
      super.email, 
      super.gender, 
      super.phone, 
      super.photo, 
      super.role, 
      super.wishlist, 
      super.addresses, 
      super.createdAt, 
      super.passwordChangedAt,});


  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;
  String? createdAt;
  String? passwordChangedAt;


}