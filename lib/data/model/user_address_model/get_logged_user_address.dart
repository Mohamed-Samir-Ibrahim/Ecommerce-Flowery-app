import 'package:json_annotation/json_annotation.dart';

part 'get_logged_user_address.g.dart';

@JsonSerializable()
class GetLoggedUserAddressResponse {
  String? message;
  List<AddressesBean> ?addresses;

  GetLoggedUserAddressResponse({this.message, this.addresses});

  factory GetLoggedUserAddressResponse.fromJson(Map<String, dynamic> json) => _$GetLoggedUserAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLoggedUserAddressResponseToJson(this);
}

@JsonSerializable()
class AddressesBean {
  String ?street;
  String ?phone;
  String? city;
  String ?lat;
  String ?long;
  String ?username;
  String ?id;

  AddressesBean({this.street, this.phone, this.city, this.lat, this.long, this.username, this.id});

  factory AddressesBean.fromJson(Map<String, dynamic> json) => _$AddressesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesBeanToJson(this);
}

