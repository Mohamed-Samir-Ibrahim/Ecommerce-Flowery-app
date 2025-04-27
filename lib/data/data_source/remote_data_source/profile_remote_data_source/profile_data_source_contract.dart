import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/change_password/change_password.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import 'package:flowery/domain/entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';

import '../../../model/profile_model/change_password/change_password_request_dto.dart';
import '../../../model/profile_model/change_password/change_password_res_dto.dart';
import '../../../model/profile_model/edit_profile/edit_profile_request_dto.dart';

import '../../../model/profile_model/log_out/log_out_response_dto.dart';

abstract class ProfileDataSourceContract {
  Future<ApiResult<List<Citiesentity>>>get();
  Future<ApiResult<List<statesentity>>>getStates();
  Future<ApiResult<Addaddress>>saveAddress(AddAddressRequest request);
  Future<ApiResult<LogoutResponseDm>> logout(String token);
  Future<ApiResult<GetLoggedUserDataEntity>> getLoggedUserData(String token);
  Future<ApiResult<EditProfileEntity>> editProfile(EditProfileRequestDto request);
  Future<ApiResult<ChangePasswordEntity>> changePassword(ChangePasswordRequestDto request);
}

