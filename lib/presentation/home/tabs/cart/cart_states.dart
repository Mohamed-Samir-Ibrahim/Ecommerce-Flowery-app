import 'package:equatable/equatable.dart';
import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_response.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';


enum Status { loading, success, error, }

class CartStates extends Equatable {
  Status status;
  CreatCashOrderResponse ?cashOrderResponse;
  CheckoutSessionResponse? checkoutSessionResponse;
  Exception? exception;
  String? loadingMessage;

  CartStates({required this.status,
    this.exception,
    this.loadingMessage,
    this.cashOrderResponse, this.checkoutSessionResponse
  });

  CartStates copyWith({
    Status? status,
    Exception? exception,
    CheckoutSessionResponse? checkoutSessionResponse,
    CreatCashOrderResponse ?cashOrderResponse,

    String? loadingMessage,
  }) {
    return CartStates(
        status: status ?? this.status,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        exception: exception ?? this.exception,
        cashOrderResponse: cashOrderResponse ?? this.cashOrderResponse,
        checkoutSessionResponse: checkoutSessionResponse ??
            this.checkoutSessionResponse
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        status,
        exception,
        loadingMessage,
        checkoutSessionResponse,
        cashOrderResponse
      ];

}

