
import 'package:json_annotation/json_annotation.dart';

part'Logout_response.g.dart';
@JsonSerializable()
class Logout_response_DM {
  Logout_response_DM({
      this.message,});
  String? message;

  factory Logout_response_DM.fromJson(Map<String, dynamic> json) =>
      _$Logout_response_DMFromJson(json);
  Map<String, dynamic> toJson() => _$Logout_response_DMToJson(this);
}