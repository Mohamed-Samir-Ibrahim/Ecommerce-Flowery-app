import 'package:json_annotation/json_annotation.dart';

part 'payment_request.g.dart';

@JsonSerializable()
class PaymentRequest {
  ShippingAddressBean ?shippingAddress;

  PaymentRequest({this.shippingAddress});

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => _$PaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}

@JsonSerializable()
class ShippingAddressBean {
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;

  ShippingAddressBean({this.street, this.phone, this.city, this.lat, this.long});

  factory ShippingAddressBean.fromJson(Map<String, dynamic> json) => _$ShippingAddressBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressBeanToJson(this);
}

