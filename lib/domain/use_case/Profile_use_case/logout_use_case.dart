// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flowery/data/model/Profile/logout/Logout_response.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class logout_use_case
{
AuthRepositoryContract obj_AuthRepositoryContract;
logout_use_case({required this.obj_AuthRepositoryContract});

Future<ApiResult<Logout_response_DM>> invoke()async{
     var response = await obj_AuthRepositoryContract.logout();
    return response;
}
}
