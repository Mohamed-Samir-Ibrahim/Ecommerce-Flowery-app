import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/payment_use_case/checkout_session_use_case.dart';
import 'package:flowery/domain/use_case/payment_use_case/create_cash_order_use_case.dart';
import 'package:flowery/presentation/home/tabs/cart/cart_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class CartViewModel extends Cubit<CartStates> {
  CheckoutSessionUseCase checkoutSessionUseCase;

  CreateCashOrderUseCase cashOrderUseCase;
  bool isCashOrder=true;
  CartViewModel(this.checkoutSessionUseCase, this.cashOrderUseCase)
    : super(CartStates(status: Status.loading));

  void _checkoutSession() async {
    emit(state.copyWith(status: Status.loading));

    var result = await checkoutSessionUseCase.invoke(
      request: PaymentRequest(
        shippingAddress: ShippingAddressBean(
          city: "Cairo",
          lat: "String",
          long: "String",
          phone: "01010800921",
          street: "details",
        ),
      ),
      token:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM",
    );
    switch (result) {
      case Success():
        {
          emit(
            state.copyWith(
              status: Status.success,
              checkoutSessionResponse: result.data,
            ),
          );
        }
      case Error():
        {
          var e = result.exception;

          emit(state.copyWith(status: Status.error, exception: e));
        }
    }
  }

  void _createCashOrder() async {
    emit(state.copyWith(status: Status.loading));

    var result = await cashOrderUseCase.invoke(
      request: PaymentRequest(
        shippingAddress: ShippingAddressBean(
          city: "Cairo",
          lat: "String",
          long: "String",
          phone: "01010800921",
          street: "details",
        ),
      ),
      token:
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM",
    );
    switch (result) {
      case Success():
        {
          emit(
            state.copyWith(
              status: Status.success,
              cashOrderResponse: result.data,
            ),
          );
        }
      case Error():
        {
          var e = result.exception;

          emit(state.copyWith(status: Status.error, exception: e));
        }
    }
  }

  void doIntent(CartIntent cartIntent) {
    switch (cartIntent) {
      case LoadCheckoutSessionIntent():
        {
          _checkoutSession();
        }
      case LoadCreateCashOrderIntent():
        {
          _createCashOrder();
        }
    }
  }
}

sealed class CartIntent {}

class LoadCheckoutSessionIntent extends CartIntent {}

class LoadCreateCashOrderIntent extends CartIntent {}
