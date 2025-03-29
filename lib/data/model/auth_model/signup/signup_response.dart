import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponseDto extends SignupEntity {


  SignupResponseDto({super.message, super.user, super.token,super.error});

    factory SignupResponseDto.fromJson(Map<String, dynamic> json) => _$SignupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseDtoToJson(this);
}

@JsonSerializable()
class UserDto extends User{


  UserDto({super.firstName, super.lastName, super.email, super.gender, super.phone, super.photo, super.role, super.wishlist, super.id, super.addresses, super.createdAt});

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

class ErrorM {
  ErrorM({
    this.error,});

  ErrorM.fromJson(dynamic json) {
    error = json['error'];
  }
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    return map;
  }

}