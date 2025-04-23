import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';

import '../../entity/profile_entity/addaddress.dart';

abstract class ProfileRepositoryContract {
  Future<ApiResult<List<Citiesentity>>>getCities();
  Future<ApiResult<List<statesentity>>>getstates();
  Future<ApiResult<Addaddress>>saveaddress(AddAddressRequest request);

}