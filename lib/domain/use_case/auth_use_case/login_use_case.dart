// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/login_response_entity.dart';
import 'package:flowery/domain/entity/auth_entity/login_request_entity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class login_use_case
{
AuthRepositoryContract obj_login_repository_contract;
login_use_case({required this.obj_login_repository_contract});

Future<ApiResult<login_response_entity>> invoke(
  {required login_request_entity request })async{
      var response = await obj_login_repository_contract.login(request: request );
      return response;
}
}