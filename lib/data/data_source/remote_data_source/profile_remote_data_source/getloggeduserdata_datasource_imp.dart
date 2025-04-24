import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/getloggeduserdata_datasource_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared_Preferences.dart';
import '../../../model/Profile/get_user_data/GetLoggedUserDataResponseDm.dart';
import '../../../web_services/WebServices.dart';
@Injectable(as: GetloggeduserdataDatasourceContract)
class GetloggeduserdataDatasourceImp implements GetloggeduserdataDatasourceContract{
  WebServices client;

  GetloggeduserdataDatasourceImp({required this.client});
  

  Future<ApiResult<GetLoggedUserDataResponseDm>> getloggeduserdata({ required String token}) async {
    return executeApi<GetLoggedUserDataResponseDm>(()async{

      var token = await SecureStorageService().getToken();
      if (token == null) {
        throw Exception('Token not found in secure storage');
      }else{
        print(token);
         var response=await client.loggedUserData('Bearer $token');
        return response;
      }
          
      }
  );}

}