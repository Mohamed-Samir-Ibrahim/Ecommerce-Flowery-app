import 'package:flowery/domain/entity/auth_entity/login_response_entity.dart';



class login_response_DM extends login_response_entity {
  
login_response_DM({  required super.message,  super.user,  super.token, super.error,});

}

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
