// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestEntity _$EditProfileRequestEntityFromJson(
  Map<String, dynamic> json,
) => EditProfileRequestEntity(
  email: json['email'] as String?,
  password: json['password'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  gender: json['gender'] as bool?,
);

Map<String, dynamic> _$EditProfileRequestEntityToJson(
  EditProfileRequestEntity instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
};
