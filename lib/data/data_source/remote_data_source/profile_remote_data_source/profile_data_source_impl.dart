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
import 'package:flowery/domain/entity/profile_entity/statesentity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared_Preferences.dart';
import '../../../model/profile_model/CitiesResponseDto.dart';
@Injectable(as: profileDataSourceContract)
class ProfileDataSourceImpl implements profileDataSourceContract {
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
  Future<ApiResult<List<StatesResponseDto>>> getstates() {
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
}