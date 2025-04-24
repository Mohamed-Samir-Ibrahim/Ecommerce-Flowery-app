import 'package:json_annotation/json_annotation.dart';

class LoggedUserDataResponseEntity {
  LoggedUserDataResponseEntity({
      this.message,
      this.user,});


  String? message;
  UserEntityy? user;
LoggedUserDataResponseEntity copyWith({  String? message,
  UserEntityy? user,
}) => LoggedUserDataResponseEntity(  message: message ?? this.message,
  user: user ?? this.user,
);

}
@JsonSerializable()
class UserEntityy {
  UserEntityy({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.role, 
      this.wishlist, 
      this.addresses, 
      this.createdAt, 
      this.passwordChangedAt,});

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  List<dynamic>? wishlist;
  List<dynamic>? addresses;
  String? createdAt;
  String? passwordChangedAt;
UserEntityy copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? gender,
  String? phone,
  String? photo,
  String? role,
  List<dynamic>? wishlist,
  List<dynamic>? addresses,
  String? createdAt,
  String? passwordChangedAt,
}) => UserEntityy(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  gender: gender ?? this.gender,
  phone: phone ?? this.phone,
  photo: photo ?? this.photo,
  role: role ?? this.role,
  wishlist: wishlist ?? this.wishlist,
  addresses: addresses ?? this.addresses,
  createdAt: createdAt ?? this.createdAt,
  passwordChangedAt: passwordChangedAt ?? this.passwordChangedAt,
);


}