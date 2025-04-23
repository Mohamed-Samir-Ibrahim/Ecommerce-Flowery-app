// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Saved_Address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedAddress_Response_entity _$SavedAddress_Response_entityFromJson(
  Map<String, dynamic> json,
) => SavedAddress_Response_entity(
  message: json['message'] as String?,
  addresses: json['addresses'] as List<dynamic>?,
);

Map<String, dynamic> _$SavedAddress_Response_entityToJson(
  SavedAddress_Response_entity instance,
) => <String, dynamic>{
  'message': instance.message,
  'addresses': instance.addresses,
};
