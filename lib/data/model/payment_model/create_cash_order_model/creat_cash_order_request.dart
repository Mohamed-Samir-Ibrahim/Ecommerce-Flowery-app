import 'package:json_annotation/json_annotation.dart';

part 'creat_cash_order_request.g.dart';

@JsonSerializable()
class CreatCashOrderRequest {
  ShippingAddressBean ?shippingAddress;

  CreatCashOrderRequest({this.shippingAddress});

  factory CreatCashOrderRequest.fromJson(Map<String, dynamic> json) => _$CreatCashOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatCashOrderRequestToJson(this);
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

