// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetLoggedUserDataResponseDm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedUserDataResponseDm _$GetLoggedUserDataResponseDmFromJson(
  Map<String, dynamic> json,
) => GetLoggedUserDataResponseDm(
  message: json['message'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetLoggedUserDataResponseDmToJson(
  GetLoggedUserDataResponseDm instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) => User(
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
