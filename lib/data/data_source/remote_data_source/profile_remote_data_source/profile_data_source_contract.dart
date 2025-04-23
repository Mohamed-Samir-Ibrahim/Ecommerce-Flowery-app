import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';

abstract class profileDataSourceContract {
  Future<ApiResult<List<Citiesentity>>>get();
  Future<ApiResult<List<statesentity>>>getstates();
  Future<ApiResult<Addaddress>>saveAddress(AddAddressRequest request);

}