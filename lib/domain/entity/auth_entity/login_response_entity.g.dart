// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

login_response_entity _$login_response_entityFromJson(
  Map<String, dynamic> json,
) => login_response_entity(
  message: json['message'] as String?,
  user:
      json['user'] == null
          ? null
          : User_entity.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$login_response_entityToJson(
  login_response_entity instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user?.toJson(),
  'token': instance.token,
  'error': instance.error,
};

User_entity _$User_entityFromJson(Map<String, dynamic> json) => User_entity(
  id: json['_id'] as String?,
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
);

Map<String, dynamic> _$User_entityToJson(User_entity instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
    };
