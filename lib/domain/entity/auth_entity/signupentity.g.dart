// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupentity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupEntity _$SignupEntityFromJson(Map<String, dynamic> json) => SignupEntity(
  message: json['message'] as String?,
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  error: json['error'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$SignupEntityToJson(SignupEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
      'error': instance.error,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  wishlist: json['wishlist'] as List<dynamic>?,
  id: json['id'] as String?,
  addresses: json['addresses'] as List<dynamic>?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'wishlist': instance.wishlist,
  'id': instance.id,
  'addresses': instance.addresses,
  'createdAt': instance.createdAt,
};
