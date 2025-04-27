import 'package:flowery/domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto extends EditProfileEntity {


  EditProfileResponseDto({
    super.message,
    super.user,
  });

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoToJson(this);
}

@JsonSerializable()
class UserEditDto extends UserProfileEntity {

  UserEditDto({
    required super.id,
   required super.firstName,
    required super.lastName,
    required super.email,
    required super.gender,
    required super.phone,
    required super.photo,
    required super.password,
    required super.role,
    required super.wishlist,
    required super.addresses,
    required super.createdAt,
    required super.passwordChangedAt,
  });

  factory UserEditDto.fromJson(Map<String, dynamic> json) =>
      _$UserEditDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserEditDtoToJson(this);
}
