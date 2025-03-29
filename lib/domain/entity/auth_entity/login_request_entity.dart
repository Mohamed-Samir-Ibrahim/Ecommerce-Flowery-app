// ignore_for_file: camel_case_types

import 'package:json_annotation/json_annotation.dart';

part 'login_request_entity.g.dart';

@JsonSerializable()
class login_request_entity {
   String email;
   String password;

  login_request_entity({required this.email, required this.password});

  factory login_request_entity.fromJson(Map<String, dynamic> json) =>
      _$login_request_entityFromJson(json);

  Map<String, dynamic> toJson() => _$login_request_entityToJson(this);
  
}


