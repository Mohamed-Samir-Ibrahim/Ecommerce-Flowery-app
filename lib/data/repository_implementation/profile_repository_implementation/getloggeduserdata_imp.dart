
import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/getloggeduserdata_datasource_contract.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/getloggeduserdata_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/Profile_entity/get_user_data_entity/LoggedUserDataResponse_entity.dart';

@Injectable(as: GetLoggedUserDatacontract)
class GetloggeduserdataImpl extends GetLoggedUserDatacontract{
  GetloggeduserdataDatasourceContract getloggeduserdataDatasourceContract;
  GetloggeduserdataImpl({ required this.getloggeduserdataDatasourceContract});
  
  @override
  Future<ApiResult<LoggedUserDataResponseEntity>> GetloggeduserData({ required String token}) async {
    return await getloggeduserdataDatasourceContract.getloggeduserdata( token: token);

  }
}


