import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/getloggeduserdata_datasource_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/get_user_data_entity/logged_user_data_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../web_services/WebServices.dart';
@Injectable(as: GetloggeduserdataDatasourceContract)
class GetloggeduserdataDatasourceImp implements GetloggeduserdataDatasourceContract{
  WebServices client;

  GetloggeduserdataDatasourceImp({required this.client});
  

  Future<ApiResult<List<user_LoggedUserDataResponse_entity>>> getloggeduserdata({ required String token}) async {
    return executeApi<List<user_LoggedUserDataResponse_entity>>(()async{

      final secureStorage = const FlutterSecureStorage();
      
      String? token = await secureStorage
          .read(key: 'token');
      if (token == null) {
        throw Exception('Token not found in secure storage');
      }else{
        print(token);
         var response=await client.loggedUserData('Bearer $token');
          List<user_LoggedUserDataResponse_entity> userDataList = [response]; 
        return userDataList;
      }
          
      }
  );}

}