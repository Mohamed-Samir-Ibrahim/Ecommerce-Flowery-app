// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => EditProfileResponseDto(
  message: json['message'] as String?,
  user:
      json['user'] == null
          ? null
          : UserEditDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EditProfileResponseDtoToJson(
  EditProfileResponseDto instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};

UserEditDto _$UserEditDtoFromJson(Map<String, dynamic> json) => UserEditDto(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  gender: json['gender'] as String,
  phone: json['phone'] as String,
  photo: json['photo'] as String,
  password: json['password'] as String,
  role: json['role'] as String,
  wishlist: json['wishlist'] as List<dynamic>,
  addresses: json['addresses'] as List<dynamic>,
  createdAt: DateTime.parse(json['createdAt'] as String),
  passwordChangedAt: DateTime.parse(json['passwordChangedAt'] as String),
);

Map<String, dynamic> _$UserEditDtoToJson(UserEditDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'password': instance.password,
      'role': instance.role,
      'wishlist': instance.wishlist,
      'addresses': instance.addresses,
      'createdAt': instance.createdAt.toIso8601String(),
      'passwordChangedAt': instance.passwordChangedAt.toIso8601String(),
    };
