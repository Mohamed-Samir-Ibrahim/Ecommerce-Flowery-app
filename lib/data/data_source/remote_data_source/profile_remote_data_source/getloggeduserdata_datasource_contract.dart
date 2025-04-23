import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/get_user_data_entity/logged_user_data_entity.dart';

abstract class GetloggeduserdataDatasourceContract{
  Future<ApiResult<List<user_LoggedUserDataResponse_entity>>>getloggeduserdata({ required String token});
}