import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';
import 'package:flowery/domain/entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetLoggedUserDataResponseDm.g.dart';
@JsonSerializable()
class GetLoggedUserDataResponseDm  extends LoggedUserDataResponseEntity{
  GetLoggedUserDataResponseDm({
      super.message,
      super.user,});

  factory GetLoggedUserDataResponseDm.fromJson(Map<String, dynamic> json) => _$GetLoggedUserDataResponseDmFromJson(json);


}
@JsonSerializable()
class User extends UserEntityy{
  User({
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
    super.passwordChangedAt,});


User copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? gender,
  String? phone,
  String? photo,
  String? role,
  List<dynamic>? wishlist,
  List<dynamic>? addresses,
  String? createdAt,
  String? passwordChangedAt,
}) => User(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  gender: gender ?? this.gender,
  phone: phone ?? this.phone,
  photo: photo ?? this.photo,
  role: role ?? this.role,
  wishlist: wishlist ?? this.wishlist,
  addresses: addresses ?? this.addresses,
  createdAt: createdAt ?? this.createdAt,
  passwordChangedAt: passwordChangedAt ?? this.passwordChangedAt,
);
factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}