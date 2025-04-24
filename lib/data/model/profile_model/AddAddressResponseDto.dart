import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class AddAddressResponseDto extends Addaddress {
  AddAddressResponseDto({
      super.message,
      super.address,});

  AddAddressResponseDto.fromJson(dynamic json) {
    message = json['message'];
    if (json['address'] != null) {
      address = [];
      json['address'].forEach((v) {
        address?.add(AddressDto.fromJson(v));
      });
    }
  }


}
@JsonSerializable()
class AddressDto extends Address {
  AddressDto({
      this.street, 
      this.phone, 
      this.city, 
      this.lat, 
      this.long, 
      this.username, 
      this.id,});

  AddressDto.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    username = json['username'];
    id = json['_id'];
  }
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;
  String? id;
AddressDto copyWith({  String? street,
  String? phone,
  String? city,
  String? lat,
  String? long,
  String? username,
  String? id,
}) => AddressDto(  street: street ?? this.street,
  phone: phone ?? this.phone,
  city: city ?? this.city,
  lat: lat ?? this.lat,
  long: long ?? this.long,
  username: username ?? this.username,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['long'] = long;
    map['username'] = username;
    map['_id'] = id;
    return map;
  }

}