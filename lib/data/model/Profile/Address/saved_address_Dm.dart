


// ignore_for_file: camel_case_types

import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable(explicitToJson: true)

class SavedAddress_DM  extends SavedAddress_Response_entity {
  SavedAddress_DM({
      super.message, 
      super.addresses,});
}