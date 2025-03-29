import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/signup/signup_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SignupRemoteDataSourceContract)
class SignUpRemoteDataSourceImpl implements SignupRemoteDataSourceContract{
  WebServices webServices;
  SignUpRemoteDataSourceImpl({required this.webServices});

  @override
  Future<ApiResult<SignupResponseDto>> signup(String firstName, String lastName, String email, String password, String rePassword, String phone, String gender) async {
    return executeApi<SignupResponseDto>(()async {
return    await webServices.getpost({
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "rePassword": rePassword,
    "phone": phone,
    "gender": gender
  });





    }  ,);


    }

}