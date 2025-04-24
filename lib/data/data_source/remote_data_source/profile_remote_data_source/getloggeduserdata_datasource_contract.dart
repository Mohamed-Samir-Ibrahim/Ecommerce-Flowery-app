import 'package:flowery/domain/common/api_result.dart';

import '../../../../domain/entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';

abstract class GetloggeduserdataDatasourceContract{
  Future<ApiResult<LoggedUserDataResponseEntity>>getloggeduserdata({ required String token});
}