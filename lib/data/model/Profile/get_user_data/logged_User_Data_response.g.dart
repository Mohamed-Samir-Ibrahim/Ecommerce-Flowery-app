// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_User_Data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedUserDataResponseDm _$GetLoggedUserDataResponseDmFromJson(
  Map<String, dynamic> json,
) => GetLoggedUserDataResponseDm(
  message: json['message'] as String?,
  userdata:
      (json['userdata'] as List<dynamic>?)
          ?.map(
            (e) => user_LoggedUserDataResponse_entity.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
);

Map<String, dynamic> _$GetLoggedUserDataResponseDmToJson(
  GetLoggedUserDataResponseDm instance,
) => <String, dynamic>{
  'message': instance.message,
  'userdata': instance.userdata,
};

UserGetLoggedUserDataResponseDm _$UserGetLoggedUserDataResponseDmFromJson(
  Map<String, dynamic> json,
) => UserGetLoggedUserDataResponseDm(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  wishlist: json['wishlist'] as List<dynamic>?,
  addresses: json['addresses'] as List<dynamic>?,
  createdAt: json['createdAt'] as String?,
  passwordChangedAt: json['passwordChangedAt'] as String?,
);

Map<String, dynamic> _$UserGetLoggedUserDataResponseDmToJson(
  UserGetLoggedUserDataResponseDm instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'wishlist': instance.wishlist,
  'addresses': instance.addresses,
  'createdAt': instance.createdAt,
  'passwordChangedAt': instance.passwordChangedAt,
};
