import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? password;
  EditProfileRequestDto({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.password,

  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);
}