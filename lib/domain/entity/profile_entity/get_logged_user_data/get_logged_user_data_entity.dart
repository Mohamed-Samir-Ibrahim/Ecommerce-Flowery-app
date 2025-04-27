
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetLoggedUserDataEntity {
  final String? message;
  final GetUserProfileEntity? user;

  GetLoggedUserDataEntity({required this.message, required this.user});


}
@JsonSerializable()
class GetUserProfileEntity {
  final String ?id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  final List<dynamic>? addresses;
  final DateTime? createdAt;
  final DateTime? passwordChangedAt;

   GetUserProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.role,
    required this.wishlist,
    required this.addresses,
    required this.createdAt,
    required this.passwordChangedAt,
  });


}
