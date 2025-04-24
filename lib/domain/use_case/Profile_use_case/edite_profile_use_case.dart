// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edit_profile_request_entity.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/edit_profile_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class edite_profile_use_case
{
EditProfileContract obj_EditProfileContract;
edite_profile_use_case({required this.obj_EditProfileContract});

Future<ApiResult<EditProfileResponseEntity>> invoke(
    {required String token, required EditProfileRequestEntity update })async{
      var response = await obj_EditProfileContract.editeprofile(token: token , update: update);
      return response;
}
}