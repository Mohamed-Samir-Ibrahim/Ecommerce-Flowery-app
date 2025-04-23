import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Addaddress {
  Addaddress({
      this.message, 
      this.address,});


  String? message;
  List<Address>? address;
Addaddress copyWith({  String? message,
  List<Address>? address,
}) => Addaddress(  message: message ?? this.message,
  address: address ?? this.address,
);

}
@JsonSerializable()
class Address {
  Address({
      this.street, 
      this.phone, 
      this.city, 
      this.lat, 
      this.long, 
      this.username, 
      this.id,});


  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;
  String? id;
Address copyWith({  String? street,
  String? phone,
  String? city,
  String? lat,
  String? long,
  String? username,
  String? id,
}) => Address(  street: street ?? this.street,
  phone: phone ?? this.phone,
  city: city ?? this.city,
  lat: lat ?? this.lat,
  long: long ?? this.long,
  username: username ?? this.username,
  id: id ?? this.id,
);


}