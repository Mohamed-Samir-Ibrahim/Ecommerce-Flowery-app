import 'package:flowery/domain/repository_contract/profile_repository_contract/profile_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/profile_model/log_out/log_out_response_dto.dart';
import '../../common/api_result.dart';
@injectable
class LogOutUseCase {
  ProfileRepositoryContract profileRepository;
  LogOutUseCase(this.profileRepository);
  Future<ApiResult<LogoutResponseDm>> invoke(String token) => profileRepository.logout(token);
}