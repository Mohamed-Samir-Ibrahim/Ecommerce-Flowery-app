// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUserDataResponse_entity _$LoggedUserDataResponse_entityFromJson(
  Map<String, dynamic> json,
) => LoggedUserDataResponse_entity(
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

Map<String, dynamic> _$LoggedUserDataResponse_entityToJson(
  LoggedUserDataResponse_entity instance,
) => <String, dynamic>{
  'message': instance.message,
  'userdata': instance.userdata,
};

user_LoggedUserDataResponse_entity _$user_LoggedUserDataResponse_entityFromJson(
  Map<String, dynamic> json,
) => user_LoggedUserDataResponse_entity(
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

Map<String, dynamic> _$user_LoggedUserDataResponse_entityToJson(
  user_LoggedUserDataResponse_entity instance,
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
