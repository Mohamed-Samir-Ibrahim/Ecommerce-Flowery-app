import 'package:flowery/domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';
part 'get_logged_user_data_response_dto.g.dart';

@JsonSerializable()
class UserDataDm extends GetUserProfileEntity {
  UserDataDm({
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
     super.passwordChangedAt,
  });

  factory UserDataDm.fromJson(Map<String, dynamic> json) =>
      _$UserDataDmFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataDmToJson(this);
}

@JsonSerializable()
class GetLoggedUserDataResponseDm extends GetLoggedUserDataEntity{

  GetLoggedUserDataResponseDm({super.message, super.user});

  factory GetLoggedUserDataResponseDm.fromJson(Map<String, dynamic> json) =>
      _$GetLoggedUserDataResponseDmFromJson(json);
  Map<String, dynamic> toJson() => _$GetLoggedUserDataResponseDmToJson(this);
}
