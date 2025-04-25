import 'package:flowery/domain/entity/Profile_entity/change_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_dto.g.dart';

@JsonSerializable()
class ChangePasswordDto extends ChangePasswordEntity {
  ChangePasswordDto({
     super.message,
     super.token,
  });

  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) => _$ChangePasswordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordDtoToJson(this);
}