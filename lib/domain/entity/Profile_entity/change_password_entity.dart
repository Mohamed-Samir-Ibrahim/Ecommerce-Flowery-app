
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ChangePasswordEntity {
  final String? message;
  final String? token;

  ChangePasswordEntity({
    this.message,
    this.token,
  });

  
}