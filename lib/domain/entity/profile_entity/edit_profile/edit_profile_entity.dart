
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EditProfileEntity {
  final String? message;
  final UserProfileEntity? user;

  EditProfileEntity({
    this.message,
    this.user,
  });

}
@JsonSerializable()
class UserProfileEntity{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String password;
  final String role;

  final List<dynamic> wishlist;
  final List<dynamic> addresses;
  final DateTime createdAt;
  final DateTime passwordChangedAt;

  UserProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.password,
    required this.role,
    required this.wishlist,
    required this.addresses,
    required this.createdAt,
    required this.passwordChangedAt,
  });

}

