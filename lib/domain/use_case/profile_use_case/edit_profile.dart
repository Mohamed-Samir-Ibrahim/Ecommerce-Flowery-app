import 'package:injectable/injectable.dart';

import '../../../data/model/profile_model/edit_profile/edit_profile_request_dto.dart';
import '../../common/api_result.dart';
import '../../entity/profile_entity/edit_profile/edit_profile_entity.dart';
import '../../repository_contract/profile_repository_contract/profile_repository_contract.dart';
@injectable
class EditProfileUseCase {
  final ProfileRepositoryContract repositoryContract;

  EditProfileUseCase(this.repositoryContract);

  Future<ApiResult<EditProfileEntity>> editProfile(
      EditProfileRequestDto request) async {
    return await repositoryContract.editProfile(request);
  }
}