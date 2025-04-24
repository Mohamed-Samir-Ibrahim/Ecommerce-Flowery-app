// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member

import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/edite_profile_datasource_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edit_profile_request_entity.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/edit_profile_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileContract)
class EditprfileRepositoryimplementation extends EditProfileContract {
final EditeProfileDatasourceContract obj_EditeProfileDatasourceContract;
EditprfileRepositoryimplementation({required this.obj_EditeProfileDatasourceContract});

  @override
  Future<ApiResult<EditProfileResponseEntity>> editeprofile({
    required String token, required EditProfileRequestEntity update}) async{
  return await obj_EditeProfileDatasourceContract.editprofile( token: token  , update: update );
  }
}


