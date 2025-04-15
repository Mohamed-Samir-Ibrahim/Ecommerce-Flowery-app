
import 'package:json_annotation/json_annotation.dart';

part 'login_entity.g.dart';


@JsonSerializable(explicitToJson: true) 
class login_response_entity   {
   String? message;
   User_entity? user;
   String? token;
   String? error;

  login_response_entity({ this.message,  this.user,  this.token,this.error});
factory login_response_entity.fromJson(Map<String, dynamic> json) => _$login_response_entityFromJson(json);
  Map<String, dynamic> toJson() => _$login_response_entityToJson(this);
}

@JsonSerializable(explicitToJson: true) 
class User_entity {
  @JsonKey(name: "_id")
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

  User_entity({
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
  });
factory User_entity.fromJson(Map<String, dynamic> json) => _$User_entityFromJson(json);
  Map<String, dynamic> toJson() => _$User_entityToJson(this);
  
}
