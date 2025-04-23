// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edite_profile_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseEntity _$EditProfileResponseEntityFromJson(
  Map<String, dynamic> json,
) => EditProfileResponseEntity(
  message: json['message'] as String?,
  user:
      json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  error: json['error'] as String?,
);

Map<String, dynamic> _$EditProfileResponseEntityToJson(
  EditProfileResponseEntity instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user?.toJson(),
  'error': instance.error,
};

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
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

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
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
