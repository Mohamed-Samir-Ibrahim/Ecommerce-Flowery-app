import 'package:flowery/data/model/cart_model/cart_request.dart';
import 'package:flowery/data/web_services/WebServices.dart';
import 'package:flowery/domain/common/api_result.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/domain/use_case/cart_use_case/cart_use_case.dart';
import 'package:flowery/domain/use_case/cart_use_case/delete_item_use_case.dart';
import 'package:flowery/domain/use_case/cart_use_case/get_cart_use_case.dart';
import 'package:flowery/presentation/home/tabs/cart/cubit/Cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/shared_Preferences.dart';
import 'Cart_states.dart';
@singleton
class CartViewModel extends Cubit<CartStates> {
  cart_usecase cart;
  // WebServices? webServices;
  DeleteItemUseCase delete;
  getCartUseCase getcart;

  CartViewModel({required this.cart,required this.getcart,required this.delete,})
      : super(CartStates(state: states.initial));

  void AddCart(String product, int quantity ) async {
    emit(state.copyWith(state: states.loading));

    var response = await cart.invoke(
        cartreq: CartRequest(product: product, quantity: quantity));
    switch (response) {
      case Success() :
        {
          emit(state.copyWith(
              state: states.success, cartResponseDto: response.data));
        }
      case Error() :
        {
          emit(state.copyWith(
              state: states.error, exception: response.exception));
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
              state.copyWith(state: states.success, cartResponseDto: response.data ));
          print(token);        }
      case Error() :
    }
  }

  // Future<void> deletet(String productid)async{
  //   var token = await SecureStorageService().getToken();
  //  var res= await webServices?.deleteCartSP(productid, 'Bearer $token');
  //  switch(res){
  //    case Success():{
  //
  //
  //      await getCart();
  //
  //      print(res.data?.cart?.cartItems?.toString());
  //
  //    }
  //    case Error():{
  //      emit(state.copyWith(state: states.error,exception: res.exception));
  //    }
  //  }
  //
  // }

  dointent(CartIntent cartIntent) {
    switch (cartIntent) {
      case AddCartIntent():
        AddCart(cartIntent.productid, cartIntent.quantity);

      case getCartIntent():
        getCart();


    }

  }
}
sealed class CartIntent{}

class AddCartIntent extends CartIntent{
String productid;
int quantity;

AddCartIntent({required this.productid,required this.quantity});
}
class getCartIntent extends CartIntent{}
