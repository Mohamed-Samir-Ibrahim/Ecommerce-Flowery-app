import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/domain/common/api_result.dart';

abstract class PaymentRepositoryContract {
  Future<ApiResult<CreatCashOrderResponse>> createCashOrder({
     required PaymentRequest request,
    required String token,
  });
  Future<ApiResult<CheckoutSessionResponse>> checkoutSession({
    required PaymentRequest request,
    required String token,
  });
}