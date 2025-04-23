// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/Profile_entity/address_entity/Saved_Address_entity.dart';
import 'package:flowery/domain/repository_contract/Profile_repository_contract/saved_address_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class saved_adress_use_case
{
SavedAddressContract obj_SavedAddressContract;
saved_adress_use_case({required this.obj_SavedAddressContract});

Future<ApiResult<List<SavedAddress_Response_entity>>>invoke({required String token,})async{
      var response = await obj_SavedAddressContract.savedaddress( token: 'Bearer $token',);
      return response;
}
}