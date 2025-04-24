import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/getloggeduserdata_contract.dart';
import 'package:injectable/injectable.dart';

import '../../entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';

@injectable
class GetLoggedUserUseCase {
  final GetLoggedUserDatacontract getLoggedUserDatacontract;  
  GetLoggedUserUseCase(this.getLoggedUserDatacontract);

  Future<ApiResult<LoggedUserDataResponseEntity>> invoke( { required String token}) async {
    var response = await getLoggedUserDatacontract.GetloggeduserData(token: token);
    print("✅ GetLoggedUserUseCase Response: $response");
    return response;  
  }
}