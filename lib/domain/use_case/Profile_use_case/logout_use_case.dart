// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/logout_entity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class logout_use_case
{
AuthRepositoryContract obj_AuthRepositoryContract;
logout_use_case({required this.obj_AuthRepositoryContract});

Future<ApiResult<logout_response_entity>> invoke()async{
     var response = await obj_AuthRepositoryContract.logout();
    return response;
}
}
