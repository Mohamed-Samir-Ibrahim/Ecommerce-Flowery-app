import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:flowery/domain/repository_contract/payment_repository_contract/payment_repository_contract.dart';
import 'package:flowery/domain/repository_contract/user_address_repository_contract/user_address_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserAddressUseCase {
  final UserAddressRepositoryContract _addressRepositoryContract;

  GetLoggedUserAddressUseCase(this._addressRepositoryContract);

  Future<ApiResult<GetLoggedUserAddressResponse>> invoke({
    required String token,
  }) async {
    var response = await _addressRepositoryContract.getLoggedUserAddresses(
      token: token,
    );
    return response;
  }
}
