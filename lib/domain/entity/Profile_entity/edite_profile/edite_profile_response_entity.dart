import 'package:json_annotation/json_annotation.dart';

part 'edite_profile_response_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class EditProfileResponseEntity {
  String? message;
  UserEntity? user;
  String? error;

  EditProfileResponseEntity({this.message, this.user, this.error});

  factory EditProfileResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$EditProfileResponseEntityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserEntity {
  @JsonKey(name: "_id")
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

  UserEntity({
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
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
