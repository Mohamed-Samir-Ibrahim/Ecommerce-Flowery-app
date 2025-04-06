// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponse(
  message: json['message']??"",
  token: json['token'] ??"",
  error: json['error']??"",
);

Map<String, dynamic> _$ResetPasswordResponseToJson(
  ResetPasswordResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'error': instance.error,
};
