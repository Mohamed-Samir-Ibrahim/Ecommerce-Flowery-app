import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edit_profile_request_entity.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';


abstract class EditProfileContract{
  Future<ApiResult<EditProfileResponseEntity>>editeprofile({
    required String token, required EditProfileRequestEntity update});


}