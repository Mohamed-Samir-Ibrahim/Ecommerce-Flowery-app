// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logged_user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedUserAddressResponse _$GetLoggedUserAddressResponseFromJson(
  Map<String, dynamic> json,
) => GetLoggedUserAddressResponse(
  message: json['message'] as String?,
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressesBean.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetLoggedUserAddressResponseToJson(
  GetLoggedUserAddressResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'addresses': instance.addresses,
};

AddressesBean _$AddressesBeanFromJson(Map<String, dynamic> json) =>
    AddressesBean(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      username: json['username'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddressesBeanToJson(AddressesBean instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.username,
      'id': instance.id,
    };
