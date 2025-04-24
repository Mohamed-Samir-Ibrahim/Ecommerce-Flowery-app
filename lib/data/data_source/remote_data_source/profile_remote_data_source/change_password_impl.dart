import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/data/model/Profile/change_password/change_password_dto.dart';
import 'package:flowery/data/model/Profile/change_password/change_password_request.dart';
import 'package:flowery/domain/entity/Profile_entity/change_password_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/data/api_excuter.dart';
import '../../../web_services/WebServices.dart';
import 'change_password_contract.dart';

@Injectable(as: ChangePasswordContract)
class ChangePasswordImpl implements ChangePasswordContract {
  final WebServices client;
  
  ChangePasswordImpl({required this.client});

  @override
  Future<ApiResult<ChangePasswordDto>> changePassword(ChangePasswordRequest changePasswordRequest) async{
    var token = await SecureStorageService().getToken();
    return executeApi(() async {
      return await client.changePassword(changePasswordRequest.toJson(), 'Bearer $token');
    });
  }
}