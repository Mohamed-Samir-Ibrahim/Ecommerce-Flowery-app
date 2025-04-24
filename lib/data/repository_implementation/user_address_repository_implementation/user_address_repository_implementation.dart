import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/data_source/remote_data_source/payment_method_data_source/payment_remote_data_source_contract.dart';
import 'package:flowery/data/data_source/remote_data_source/user_address_data_source/user_address_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:flowery/domain/repository_contract/payment_repository_contract/payment_repository_contract.dart';
import 'package:flowery/domain/repository_contract/user_address_repository_contract/user_address_repository_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entity/auth_entity/login_entity.dart';
import '../../../domain/entity/auth_entity/login_request_entity.dart';
import '../../model/auth_model/reset_password/reset_password_request.dart';
import '../../model/auth_model/reset_password/reset_password_response.dart';
@Injectable(as: UserAddressRepositoryContract)

class UserAddressRepositoryImplementation extends UserAddressRepositoryContract{
  final UserAddressRemoteDataSourceContract _addressRemoteDataSourceContract  ;
  UserAddressRepositoryImplementation(this._addressRemoteDataSourceContract);


  @override
  Future<ApiResult<GetLoggedUserAddressResponse>> getLoggedUserAddresses({ required String token})async {
    return await _addressRemoteDataSourceContract.getLoggedUserAddresses(token: token);

  }




}