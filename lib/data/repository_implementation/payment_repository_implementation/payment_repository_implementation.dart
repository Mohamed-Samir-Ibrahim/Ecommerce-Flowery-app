import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/data_source/remote_data_source/payment_method_data_source/payment_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:flowery/domain/repository_contract/auth_repository_contract/auth_repository_contract.dart';
import 'package:flowery/domain/repository_contract/payment_repository_contract/payment_repository_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entity/auth_entity/login_entity.dart';
import '../../../domain/entity/auth_entity/login_request_entity.dart';
import '../../model/auth_model/reset_password/reset_password_request.dart';
import '../../model/auth_model/reset_password/reset_password_response.dart';
@Injectable(as: PaymentRepositoryContract)

class PaymentRepositoryImplementation extends PaymentRepositoryContract{
  final PaymentRemoteDataSourceContract _paymentRemoteDataSourceContract;
  PaymentRepositoryImplementation(this._paymentRemoteDataSourceContract);


  @override
  Future<ApiResult<CheckoutSessionResponse>> checkoutSession({required PaymentRequest request, required String token})async {
    return await _paymentRemoteDataSourceContract.checkoutSession(request: request,token: token);

  }

  @override
  Future<ApiResult<CreatCashOrderResponse>> createCashOrder({required PaymentRequest request, required String token}) async{
    return await _paymentRemoteDataSourceContract.createCashOrder(request: request,token: token);

  }


}