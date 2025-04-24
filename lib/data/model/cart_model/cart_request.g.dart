// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRequest _$CartRequestFromJson(Map<String, dynamic> json) => CartRequest(
  product: json['product'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartRequestToJson(CartRequest instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
