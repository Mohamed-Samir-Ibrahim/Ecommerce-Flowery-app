// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member

import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/saved_address_data_source_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/saved_address_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SavedAddressContract)
class SavedAddressImplementation extends SavedAddressContract{
final SavedAddressDataSourceContract obj_SavedAddressDataSourceContract;
SavedAddressImplementation({required this.obj_SavedAddressDataSourceContract});
  
  @override
  Future<ApiResult<List<SavedAddress_Response_entity>>> savedaddress(
    {required String token})async {
    return await obj_SavedAddressDataSourceContract.savedaddress( token: token);
  
  }
}



  
 


