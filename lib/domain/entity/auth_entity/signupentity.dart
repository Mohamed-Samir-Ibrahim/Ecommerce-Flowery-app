import 'package:json_annotation/json_annotation.dart';

part 'signupentity.g.dart';  // أضف هذا السطر هنا

@JsonSerializable()
class SignupEntity {
  SignupEntity({
    this.message,
    this.user,
    this.error,
    this.token,
  });
  String? message;
  User? user;
  String? token;
  String? error;

  // أضف هنا الـ factory و toJson
  factory SignupEntity.fromJson(Map<String, dynamic> json) =>
      _$SignupEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignupEntityToJson(this);
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
    this.createdAt,
  });

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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
