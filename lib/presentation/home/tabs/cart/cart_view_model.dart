import 'package:flowery/data/model/payment_model/checkout_session_model/checkout_session_request.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_request.dart';
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
  CartViewModel(this.checkoutSessionUseCase ,this.cashOrderUseCase) : super(CartStates(status: Status.loading));
  void _checkoutSession() async {

    emit(state.copyWith(status: Status.loading));

    var result= await checkoutSessionUseCase.invoke(request: CheckoutSessionRequest(), token: "");
    switch(result){
      case Success():{

        emit(state.copyWith(status: Status.success,checkoutSessionResponse:result.data));

      }
      case Error():{
        var e=result.exception;


        emit(state.copyWith(status: Status.error,exception: e));
      }
    }


  }
  void _createCashOrder() async {

    emit(state.copyWith(status: Status.loading));

    var result= await cashOrderUseCase.invoke(request: CreatCashOrderRequest(), token: "");
    switch(result){
      case Success():{

        emit(state.copyWith(status: Status.success,cashOrderResponse:result.data));

      }
      case Error():{
        var e=result.exception;


        emit(state.copyWith(status: Status.error,exception: e));
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
class LoadCreateCashOrderIntent extends CartIntent {

}
