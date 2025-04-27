
import 'package:flowery/domain/entity/profile_entity/change_password/change_password.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/profile_model/change_password/change_password_request_dto.dart';
import '../../common/api_result.dart';
import '../../repository_contract/profile_repository_contract/profile_repository_contract.dart';
@injectable
class ChangePasswordUseCase {
  ProfileRepositoryContract repository;
  ChangePasswordUseCase(this.repository);

  Future<ApiResult<ChangePasswordEntity>> invoke(ChangePasswordRequestDto request) async {
    return await repository.changePassword(request);
  }
}