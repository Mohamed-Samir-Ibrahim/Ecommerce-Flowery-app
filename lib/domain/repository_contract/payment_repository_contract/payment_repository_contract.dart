import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_request.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_request.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/domain/common/api_result.dart';

abstract class PaymentRepositoryContract {
  Future<ApiResult<CreatCashOrderResponse>> createCashOrder({
     required CreatCashOrderRequest request,
    required String token,
  });
  Future<ApiResult<CheckoutSessionResponse>> checkoutSession({
    required CheckoutSessionRequest request,
    required String token,
  });
}