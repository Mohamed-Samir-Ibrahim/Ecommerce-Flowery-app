import 'package:flowery/presentation/home/tabs/cart/cubit/Cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_Preferences.dart';
import '../../../../core/utils/resources/custom_elevated_button.dart';
import '../../../../di/injetible_intinalizer.dart';
import 'cart_item.dart';
import 'cubit/cart_view_model.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartViewModel cartViewModel = getIt<CartViewModel>();



  @override
  Widget build(BuildContext context) {

    return BlocProvider<CartViewModel>.value(
      value: cartViewModel..dointent(getCartIntent()),
      child: BlocBuilder<CartViewModel,CartStates>(

        builder: (context,state) {
      var token = SecureStorageService().getToken();
      print(token);

          final item = state.cartResponseDto?.cart?.cartItems?? [];
          return Scaffold(
              appBar: AppBar(
                title: Text(
                    'Cart (${state.cartResponseDto?.numOfCartItems} items)'),
              ),
              body: item.isEmpty?Center(child: Text('Your cart is empty')) :ListView.builder(

                itemCount: state.cartResponseDto?.cart?.cartItems?.length,
                itemBuilder: (BuildContext context, int index) {
                  return cartitem(cartI: item[index],);
                },
              )
          );
        } ),
    );
  }
}