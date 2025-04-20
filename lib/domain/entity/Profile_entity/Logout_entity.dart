
import 'package:json_annotation/json_annotation.dart';
part 'logout_entity.g.dart';

@JsonSerializable(explicitToJson: true) 
class logout_response_entity  {
  logout_response_entity({
    this.message});
  String? message;

factory logout_response_entity.fromJson(Map<String, dynamic> json) => _$logout_response_entityFromJson(json);
  Map<String, dynamic> toJson() => _$logout_response_entityToJson(this);
}