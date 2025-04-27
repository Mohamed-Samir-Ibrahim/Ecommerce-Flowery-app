import 'dart:convert';
import 'dart:math';

import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/profile_remote_data_source/profile_data_source_contract.dart';
import 'package:flowery/data/model/profile_model/AddAddressResponseDto.dart';
import 'package:flowery/data/model/profile_model/CitiesResponseDto.dart';
import 'package:flowery/data/model/profile_model/addAddressRequest.dart';
import 'package:flowery/data/model/profile_model/statesResponseDto.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/profile_entity/addaddress.dart';
import 'package:flowery/domain/entity/profile_entity/citiesentity.dart';
import 'package:flowery/domain/entity/profile_entity/get_logged_user_data/get_logged_user_data_entity.dart';
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared_Preferences.dart';
import '../../../../domain/entity/profile_entity/change_password/change_password.dart';
import '../../../../domain/entity/profile_entity/edit_profile/edit_profile_entity.dart';
import '../../../model/profile_model/CitiesResponseDto.dart';
import '../../../model/profile_model/change_password/change_password_request_dto.dart';
import '../../../model/profile_model/change_password/change_password_res_dto.dart';
import '../../../model/profile_model/edit_profile/edit_profile_request_dto.dart';
import '../../../model/profile_model/edit_profile/edit_profile_response_dto.dart';
import '../../../model/profile_model/get_logged_user_data/get_logged_user_data_response_dto.dart';
import '../../../model/profile_model/log_out/log_out_response_dto.dart';
@Injectable(as: ProfileDataSourceContract)
class ProfileDataSourceImpl implements ProfileDataSourceContract {
WebServices webServices;
ProfileDataSourceImpl(this.webServices);
  @override
  Future<ApiResult<List<CitiesResponseDto>>> get() {
    return executeApi<List<CitiesResponseDto>>(() async {
      return await loaddata();
    });
  }

  Future<List<CitiesResponseDto>> loaddata() async {
    final String jsonString = await rootBundle.loadString('assets/cities.json');
    final List<dynamic> json = jsonDecode(jsonString);

    final tableItem = json.firstWhere(
          (element) =>
      element['type'] == 'table' && element['name'] == 'governorates',
      orElse: () => null,
    );

    if (tableItem == null || tableItem['data'] == null) {
      return [];
    }

    final List<dynamic> data = tableItem['data'];

    final cities = data.map((e) => CitiesResponseDto.fromJson(e)).toList();
    return cities;
  }

  @override
  Future<ApiResult<List<StatesResponseDto>>> getStates() {
    return executeApi<List<StatesResponseDto>>(() async {
      return await loadstates();
    });
  }

  Future<List<StatesResponseDto>> loadstates() async {
    final String jsonString = await rootBundle.loadString('assets/states.json');
    final List<dynamic> json = jsonDecode(jsonString);
    final tableItem = json.firstWhere(
          (element) =>
      element['type'] == 'table' && element['name'] == 'cities',
      orElse: () => null,
    );

    if (tableItem == null || tableItem['data'] == null) {
      return [];
    }

    final List<dynamic> data = tableItem['data'];


    return data.map((e) => StatesResponseDto.fromJson(e)).toList();

  }

  @override
  Future<ApiResult<AddAddressResponseDto>> saveAddress(AddAddressRequest request) {
    var token=SecureStorageService().getToken();
return executeApi<AddAddressResponseDto>(()async{

  return await webServices.saveaddress(request.tojson(),'Bearer $token');
});


  }

@override
Future<ApiResult<LogoutResponseDm>> logout(String token) async {
  return executeApi<LogoutResponseDm>(() async {
    return await webServices.logout(token);
}
);}

@override
Future<ApiResult<GetLoggedUserDataResponseDm>> getLoggedUserData(String token) async {

  return executeApi<GetLoggedUserDataResponseDm>(() async {
    return await webServices.getLoggedUserData(token);
  });
      }


@override
Future<ApiResult<EditProfileResponseDto>> editProfile(EditProfileRequestDto request) async {
  return executeApi<EditProfileResponseDto>(() async {
     var  token=await SecureStorageService().getToken();
     print(token);
    return await webServices.editProfile(request.toJson(), 'Bearer $token');
  });
}

@override
Future<ApiResult<ChangePasswordResponseDto>> changePassword(ChangePasswordRequestDto request) async {
  var token=SecureStorageService().getToken();
  return executeApi<ChangePasswordResponseDto>(() async {
    return await webServices.changePassword(request.toJson(), 'Bearer $token');
  });

}
}