
import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/edite_profile_datasource_contract.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edit_profile_request_entity.dart';
import 'package:flowery/domain/entity/Profile_entity/edite_profile/edite_profile_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditeProfileDatasourceContract)

class EditProfileDatasourceImp implements EditeProfileDatasourceContract {

    WebServices client;
EditProfileDatasourceImp(this.client);
  @override
  Future<ApiResult<EditProfileResponseEntity>> editprofile({
    required String token, required EditProfileRequestEntity update}) async{
    return executeApi<EditProfileResponseEntity>(() async {
      var response_edit_profile = await client.editProfile(update.toJson(),token);
      return response_edit_profile;
    });
  }
  
}


