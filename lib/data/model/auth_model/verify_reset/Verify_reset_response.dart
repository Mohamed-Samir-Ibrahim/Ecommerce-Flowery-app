import 'package:json_annotation/json_annotation.dart';

part 'Verify_reset_response.g.dart';

@JsonSerializable()
class VerifyResetResponse {
  String? status;

  VerifyResetResponse({this.status});

  factory VerifyResetResponse.fromJson(Map<String, dynamic> json) => _$VerifyResetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetResponseToJson(this);
}

