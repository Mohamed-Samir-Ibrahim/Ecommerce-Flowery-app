import 'package:flowery/domain/entity/auth_entity/login_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(explicitToJson: true) 

class login_response_DM extends login_response_entity {
  
login_response_DM({  required super.message,  super.user,  super.token, super.error,});

}

@JsonSerializable(explicitToJson: true) 
class User_Dm extends User_entity {
  User_Dm({
     super.id,
     super.firstName,
     super.lastName,
     super.email,
     super.gender,
     super.phone,
     super.photo,
     super.role,
     super.wishlist,
     super.addresses,
     super.createdAt,

  });

  
}
