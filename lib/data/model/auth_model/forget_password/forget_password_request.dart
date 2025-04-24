import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true) 

class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest(
      {required this.email});
  Map<String, dynamic> toJson() =>
      {"email": email};
}
