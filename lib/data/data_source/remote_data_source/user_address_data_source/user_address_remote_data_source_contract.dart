import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/domain/common/api_result.dart';

abstract  class UserAddressRemoteDataSourceContract {
  Future<ApiResult<GetLoggedUserAddressResponse>>getLoggedUserAddresses({required String token});
}