import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';

abstract class SavedAddressContract{
  Future<ApiResult<List<SavedAddress_Response_entity>>>savedaddress({
    required String token,});


}