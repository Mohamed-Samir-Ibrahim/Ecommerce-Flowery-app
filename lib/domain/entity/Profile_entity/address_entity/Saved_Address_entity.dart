import 'package:json_annotation/json_annotation.dart';


part 'Saved_Address_entity.g.dart';

@JsonSerializable()
class SavedAddress_Response_entity {

  SavedAddress_Response_entity({
      this.message, 
      this.addresses,});

  String? message;
  List<dynamic>? addresses;


    factory SavedAddress_Response_entity.fromJson(Map<String, dynamic> json) => _$SavedAddress_Response_entityFromJson(json);
  Map<String, dynamic> toJson() => _$SavedAddress_Response_entityToJson(this);

}