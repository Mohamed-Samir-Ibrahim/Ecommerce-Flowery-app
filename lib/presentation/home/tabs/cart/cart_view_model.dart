import 'package:flowery/core/shared_Preferences.dart';
import 'package:flowery/data/model/payment_model/payment_request/payment_request.dart';
import 'package:flowery/data/model/user_address_model/get_logged_user_address.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/use_case/payment_use_case/checkout_session_use_case.dart';
import 'package:flowery/domain/use_case/payment_use_case/create_cash_order_use_case.dart';
import 'package:flowery/domain/use_case/user_address_use_case/get_logged_user_address_use_case.dart';
import 'package:flowery/presentation/home/tabs/cart/cart_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/cart_model/cart_request.dart';
import '../../../../domain/use_case/cart_use_case/cart_use_case.dart';
import '../../../../domain/use_case/cart_use_case/get_cart_use_case.dart';

@singleton
class CartViewModel extends Cubit<CartStates> {
  CheckoutSessionUseCase checkoutSessionUseCase;
  cart_usecase cart;
  getCartUseCase getcart;
  CreateCashOrderUseCase cashOrderUseCase;
  GetLoggedUserAddressUseCase getLoggedUserAddressUseCase;
  bool isCashOrder = true;
  int selectedAddressIndex=0;
  AddressesBean ?selectedAddress;
  var token = SecureStorageService().getToken();

  CartViewModel(this.checkoutSessionUseCase, this.cashOrderUseCase,this.getLoggedUserAddressUseCase,this.cart,this.getcart)
      : super(CartStates(status: Status.loading));

  void _checkoutSession() async {
    emit(state.copyWith(status: Status.loading));

    var result = await checkoutSessionUseCase.invoke(
      request: PaymentRequest(
        shippingAddress: ShippingAddressBean(
          city: selectedAddress?.city??"",
          lat:  selectedAddress?.lat??"",
          long: selectedAddress?.long??"",
          phone:  selectedAddress?.phone??"",
          street: selectedAddress?.street??"",
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
        shippingAddress:  ShippingAddressBean(
          city: selectedAddress?.city??"",
          lat:  selectedAddress?.lat??"",
          long: selectedAddress?.long??"",
          phone:  selectedAddress?.phone??"",
          street: selectedAddress?.street??"",
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

  void _getLoggedUserAddresses() async {
    emit(state.copyWith(status: Status.loading));

    var result = await getLoggedUserAddressUseCase.invoke(token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc4YTc4M2QzYzM3OTc0OTI3NDdjOGU2Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzcxMjc5OTd9.ey-sIWm8Z9QpiUNEfK5U-Ma5lzB2NxI7-DbKZfH1wfM');
    switch (result) {
      case Success():
        {
        emit(
        state.copyWith(
        status: Status.success,
        getLoggedUserAddressResponse: result.data,
        ),);
        }
      case Error():
        {
          var e = result.exception;
          emit(state.copyWith(status: Status.error, exception: e));


        }
    }
  }
  void AddCart(String product, int quantity ) async {
    emit(state.copyWith(status: Status.loading));
    var response = await cart.invoke(
        cartreq: CartRequest(product: product, quantity: quantity));
    switch (response) {
      case Success() :
        {
          emit(state.copyWith(
              status: Status.success, cartResponseDto: response.data));
        }
      case Error() :
        {
          emit(state.copyWith(
              status: Status.error, exception: response.exception));
        }
    }
  }




  Future<void> getCart() async {
    var token = await SecureStorageService().getToken();

    var response = await getcart.get();
    switch (response) {
      case Success() :
        {
          emit(
              state.copyWith(status: Status.success, cartResponseDto: response.data ));
          print(token);        }
      case Error() :
    }
  }
  void doIntent(CartIntent cartIntent) {
    switch (cartIntent) {
      case CheckoutSessionIntent():
        {
          _checkoutSession();
        }
      case CreateCashOrderIntent():
        {
          _createCashOrder();
        }
      case GetLoggedUserAddressIntent()
      :
        {
          _getLoggedUserAddresses();
        }
        case AddCartIntent():
        AddCart(cartIntent.productid, cartIntent.quantity);
        case getCartIntent():
        getCart();

    }

  }
}

sealed class CartIntent {}

class CheckoutSessionIntent extends CartIntent {}

class CreateCashOrderIntent extends CartIntent {}

class GetLoggedUserAddressIntent extends CartIntent {}
class AddCartIntent extends CartIntent{
  String productid;
  int quantity;

  AddCartIntent({required this.productid,required this.quantity});
}
class getCartIntent extends CartIntent{}