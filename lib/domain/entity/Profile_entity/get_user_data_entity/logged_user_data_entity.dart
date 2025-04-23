
import 'package:json_annotation/json_annotation.dart';

part 'logged_user_data_entity.g.dart';

@JsonSerializable()
class LoggedUserDataResponse_entity {
  LoggedUserDataResponse_entity({
      this.message, 
      this.userdata,});

  String? message;
  List<user_LoggedUserDataResponse_entity>? userdata;

  factory LoggedUserDataResponse_entity.fromJson(Map<String, dynamic> json) => _$LoggedUserDataResponse_entityFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedUserDataResponse_entityToJson(this);
}

@JsonSerializable()
class user_LoggedUserDataResponse_entity {
  user_LoggedUserDataResponse_entity({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.role, 
      this.wishlist, 
      this.addresses, 
      this.createdAt, 
      this.passwordChangedAt,});


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

  factory user_LoggedUserDataResponse_entity.fromJson(Map<String, dynamic> json) => _$user_LoggedUserDataResponse_entityFromJson(json);
  Map<String, dynamic> toJson() => _$user_LoggedUserDataResponse_entityToJson(this);
}