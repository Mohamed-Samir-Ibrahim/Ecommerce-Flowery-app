import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/profile_data_source_contract.dart';
import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/data/model/profile_model/change_password/change_password_res_dto.dart';
import 'package:flowery/data/model/profile_model/edit_profile/edit_profile_request_dto.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flowery/domain/repository_contract/profile_repository_contract/profile_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/profile_entity/change_password/change_password.dart';
import '../../../domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import '../../../domain/entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';
import '../../model/profile_model/change_password/change_password_request_dto.dart';
import '../../model/profile_model/get_logged_user_data/get_logged_user_data_response_dto.dart';
import '../../model/profile_model/log_out/log_out_response_dto.dart';
@Injectable(as: ProfileRepositoryContract)
class ProfileRepositoryImpl implements ProfileRepositoryContract {
  ProfileDataSourceContract prof;

  ProfileRepositoryImpl(this.prof);

  @override
  Future<ApiResult<List<Citiesentity>>> getCities() async{
    return await prof.get();
  }

  @override
  Future<ApiResult<List<statesentity>>> getStates()async {
return await prof.getStates();
  }

  @override
  Future<ApiResult<Addaddress>> saveAddress(AddAddressRequest request) {
    return prof.saveAddress(request);
  }
  @override
  Future<ApiResult<LogoutResponseDm>>logout(String token)async{
    return await prof.logout(token);
  }
  @override
  Future<ApiResult<GetLoggedUserDataEntity>> getLoggedUserData(String token)async{
    return await prof.getLoggedUserData(token);
  }

  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword(ChangePasswordRequestDto request) async{
    return await prof.changePassword(request);
  }

  @override
  Future<ApiResult<EditProfileEntity>> editProfile(EditProfileRequestDto request) {
return prof.editProfile(request);
  }







}



