

import 'package:flowery/domain/entity/Profile_entity/edite_profile/edit_profile_request_entity.dart';
import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

part 'edit_profile_request.g.dart';
@JsonSerializable(explicitToJson: true)
class EditProfileRequestDM  extends EditProfileRequestEntity {
  EditProfileRequestDM({
      super.firstName, 
      super.lastName, 
      super.email, 
      super.password, 
      super.gender, 
      super.phone, 
      super.photo,});
}