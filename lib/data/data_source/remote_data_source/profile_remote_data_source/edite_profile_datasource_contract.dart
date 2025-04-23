  import 'package:flowery/data/repository_implementation/profile_repository_implementation/edite_profile_imp.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edit_profile_request_entity.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';


abstract class EditeProfileDatasourceContract {

Future<ApiResult<EditProfileResponseEntity>> editprofile(
  { required String token, required EditProfileRequestEntity update});
}

