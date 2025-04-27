import 'package:flowery/domain/entity/profile_entity/change_password/change_password.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_res_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponseDto extends ChangePasswordEntity{

  ChangePasswordResponseDto({
   required super.message,
   required super.token,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordResponseDtoToJson(this);

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseDtoFromJson(json);
}
