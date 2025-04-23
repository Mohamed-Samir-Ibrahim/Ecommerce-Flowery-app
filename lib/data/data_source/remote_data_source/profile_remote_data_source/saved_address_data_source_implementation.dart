import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/saved_address_data_source_contract.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SavedAddressDataSourceContract)
class SavedAddressDataSourceImplementation implements SavedAddressDataSourceContract {

  WebServices client;
  SavedAddressDataSourceImplementation(this.client);

  @override
  Future<ApiResult<List<SavedAddress_Response_entity>>> savedaddress({required String token,}) async {
    return executeApi<List<SavedAddress_Response_entity>>(() async {
      var response_saved_address = await client.savedaddress('Bearer $token');
      List<SavedAddress_Response_entity> userDataList = [response_saved_address]; 
        return userDataList;
         
        
      
      
    });
  }
}
