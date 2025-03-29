import 'package:json_annotation/json_annotation.dart';

part 'Forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  String? message;
  String ?info;

  ForgetPasswordResponse({this.message, this.info});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}

