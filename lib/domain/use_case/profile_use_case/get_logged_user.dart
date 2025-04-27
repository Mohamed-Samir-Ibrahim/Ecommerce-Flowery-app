import 'package:injectable/injectable.dart';

import '../../common/api_result.dart';
import '../../entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';
import '../../repository_contract/profile_repository_contract/profile_repository_contract.dart';
@injectable
class GetLoggedUserUseCase {
  final ProfileRepositoryContract prof;

GetLoggedUserUseCase(this.prof);
  Future<ApiResult<GetLoggedUserDataEntity>> invoke(String token) {
    return prof.getLoggedUserData(token);
  }
}