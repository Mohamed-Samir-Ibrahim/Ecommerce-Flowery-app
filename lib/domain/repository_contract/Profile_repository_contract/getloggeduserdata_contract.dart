// ignore_for_file: non_constant_identifier_names

import 'package:flowery/data/model/Profile/get_user_data/logged_User_Data_response.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/get_user_data_entity/logged_user_data_entity.dart';

abstract class GetLoggedUserDatacontract {
  Future<ApiResult<List<user_LoggedUserDataResponse_entity>>>GetloggeduserData({required String token});


}