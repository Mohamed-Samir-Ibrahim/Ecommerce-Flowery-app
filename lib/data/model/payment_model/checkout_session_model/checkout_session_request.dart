import 'package:json_annotation/json_annotation.dart';
part 'checkout_session_request.g.dart';


@JsonSerializable()
class CheckoutSessionRequest {
  ShippingAddressBean ?shippingAddress;

  CheckoutSessionRequest({this.shippingAddress});

  factory CheckoutSessionRequest.fromJson(Map<String, dynamic> json) => _$CheckoutSessionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutSessionRequestToJson(this);
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

