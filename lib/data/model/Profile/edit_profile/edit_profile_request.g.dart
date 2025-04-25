// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestDM _$EditProfileRequestDMFromJson(
  Map<String, dynamic> json,
) => EditProfileRequestDM(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  gender: json['gender'] as bool?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
);

Map<String, dynamic> _$EditProfileRequestDMToJson(
  EditProfileRequestDM instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
};
