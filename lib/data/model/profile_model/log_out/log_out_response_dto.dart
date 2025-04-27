import 'package:json_annotation/json_annotation.dart';

part 'log_out_response_dto.g.dart';

@JsonSerializable()
class LogoutResponseDm {
  final String? message;
final String? error;
  LogoutResponseDm( this.message,this.error);

  factory LogoutResponseDm.fromJson(Map<String, dynamic> json) => _$LogoutResponseDmFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutResponseDmToJson(this);

}