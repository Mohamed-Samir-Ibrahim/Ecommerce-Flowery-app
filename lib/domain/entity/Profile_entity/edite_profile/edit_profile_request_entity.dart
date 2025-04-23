// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_entity.g.dart';

@JsonSerializable()
class EditProfileRequestEntity {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phone;
  String? photo;
  bool? gender;

  EditProfileRequestEntity({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.photo,
    this.gender,
  });

  factory EditProfileRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestEntityToJson(this);
}
