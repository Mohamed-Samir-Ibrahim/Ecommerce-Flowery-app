// ignore_for_file: non_constant_identifier_names

import 'package:flowery/domain/common/api_result.dart';

import '../../entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';

abstract class GetLoggedUserDatacontract {
  Future<ApiResult<LoggedUserDataResponseEntity>>GetloggeduserData({required String token});


}