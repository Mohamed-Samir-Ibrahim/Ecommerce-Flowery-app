import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class SignupEntity {
  SignupEntity({
      this.message, 
      this.user,
       this.error,
      this.token,});


  String? message;
  User? user;
  String? token;
  String? error ;


}
@JsonSerializable()
class User {
  User({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.role, 
      this.wishlist, 
      this.id, 
      this.addresses, 
      this.createdAt,});


  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  String? id;
  List<dynamic>? addresses;
  String? createdAt;



}