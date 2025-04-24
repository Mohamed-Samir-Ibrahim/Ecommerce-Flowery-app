// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    PaymentRequest(
      shippingAddress:
          json['shippingAddress'] == null
              ? null
              : ShippingAddressBean.fromJson(
                json['shippingAddress'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{'shippingAddress': instance.shippingAddress};

ShippingAddressBean _$ShippingAddressBeanFromJson(Map<String, dynamic> json) =>
    ShippingAddressBean(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$ShippingAddressBeanToJson(
  ShippingAddressBean instance,
) => <String, dynamic>{
  'street': instance.street,
  'phone': instance.phone,
  'city': instance.city,
  'lat': instance.lat,
  'long': instance.long,
};
