import 'package:flowery/data/model/Profile/get_user_data/logged_User_Data_response.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/get_user_data_entity/logged_user_data_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/getloggeduserdata_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserUseCase {
  final GetLoggedUserDatacontract getLoggedUserDatacontract;  
  GetLoggedUserUseCase(this.getLoggedUserDatacontract);

  Future<ApiResult<List<user_LoggedUserDataResponse_entity>>> invoke( { required String token}) async {
    var response = await getLoggedUserDatacontract.GetloggeduserData( token: 'Bearer $token');
    print("✅ GetLoggedUserUseCase Response: $response");
    return response;  
  }
}