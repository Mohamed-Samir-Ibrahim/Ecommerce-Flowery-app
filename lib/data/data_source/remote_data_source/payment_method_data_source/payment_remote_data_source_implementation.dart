import 'package:flowery/data/api_excuter.dart';
import 'package:flowery/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_contract.dart';
import 'package:flowery/data/data_source/remote_data_source/payment_method_data_source/payment_remote_data_source_contract.dart';
import 'package:flowery/data/model/auth_model/forget_password/Forget_password_response.dart';
import 'package:flowery/data/model/auth_model/forget_password/forget_password_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_request.dart';
import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/data/model/auth_model/reset_password/reset_password_request.dart';
import 'package:flowery/data/model/auth_model/reset_password/reset_password_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/data/model/auth_model/verify_reset/verify_reset_request.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_request.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_request.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/auth_entity/signupentity.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entity/auth_entity/login_entity.dart';
import '../../../../domain/entity/auth_entity/login_request_entity.dart';

@Injectable(as: PaymentRemoteDataSourceContract)
class PaymentRemoteDataSourceImplementation
    implements PaymentRemoteDataSourceContract {
  WebServices client;

  PaymentRemoteDataSourceImplementation(this.client);


  @override
  Future<ApiResult<CheckoutSessionResponse>> checkoutSession({required CheckoutSessionRequest request,required String token})async {
    return executeApi<CheckoutSessionResponse>(() async {
      var response = await client.checkoutSession(request,token);

      return response;
    });

  }

  @override
  Future<ApiResult<CreatCashOrderResponse>> createCashOrder({required CreatCashOrderRequest request,required String token}) async {
    return executeApi<CreatCashOrderResponse>(() async {
      var response = await client.createCashOrder(request,token);

      return response;
    });

  }


}


