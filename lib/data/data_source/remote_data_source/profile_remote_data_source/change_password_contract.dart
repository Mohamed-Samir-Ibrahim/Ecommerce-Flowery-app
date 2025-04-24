import 'package:flowery/data/model/Profile/change_password/change_password_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/change_password_entity.dart';

abstract class ChangePasswordContract {
  Future<ApiResult<ChangePasswordEntity>> changePassword(ChangePasswordRequest changePasswordRequest);
}