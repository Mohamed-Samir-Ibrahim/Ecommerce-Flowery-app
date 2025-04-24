import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class EditProfileResponseDM extends EditProfileResponseEntity {
  EditProfileResponseDM({
    required super.message,
    super.user,
    super.error,
  });
}

@JsonSerializable(explicitToJson: true)
class UserDM extends UserEntity {
  UserDM({
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
  });
}
