// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

login_request_entity _$login_request_entityFromJson(
  Map<String, dynamic> json,
) => login_request_entity(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$login_request_entityToJson(
  login_request_entity instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
