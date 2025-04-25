import 'package:flowery/data/model/Profile/change_password/change_password_request.dart';
import 'package:flowery/domain/entity/Profile_entity/change_password_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/chanange_password_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery/domain/common/api_result.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository repository;

  ChangePasswordUseCase({required this.repository});

  Future<ApiResult<ChangePasswordEntity>> call({
    ChangePasswordRequest? changePasswordRequest,
    String? oldPassword,
    String? newPassword
  }) {
    final request = changePasswordRequest ??
        ChangePasswordRequest(
          password: oldPassword,
          newPassword: newPassword,
        );
    return repository.changePassword(
      changePasswordRequest: request
    );
  }
}