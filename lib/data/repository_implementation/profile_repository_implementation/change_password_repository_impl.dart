import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/change_password_contract.dart';
import 'package:flowery/data/model/Profile/change_password/change_password_request.dart';
import 'package:flowery/domain/entity/Profile_entity/change_password_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/chanange_password_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery/domain/common/api_result.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordContract contract;

  ChangePasswordRepositoryImpl({required this.contract});

  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword({
    ChangePasswordRequest? changePasswordRequest
  }) async {
    return await contract.changePassword(
      changePasswordRequest??ChangePasswordRequest()
    );
  }
}