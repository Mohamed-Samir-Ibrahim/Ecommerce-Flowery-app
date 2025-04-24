import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resources/custom_elevated_button.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (3 items)'),

      ),
      body: Column(
        children: [
Row(
  children: [
    Image(image: AssetImage('assets/icon/location.png')),
    Text(' Deliver to ',style: TextStyle(fontSize: 16,
    ),),
    Text(' 2XVP+XC - Sheikh Zayed.....',style: TextStyle(
      fontSize: 16,
        fontWeight: FontWeight.bold
    ),),
    IconButton(onPressed: (){}, icon:Icon(Icons.keyboard_arrow_down_sharp)),

  ],
),
          SizedBox(height: 5,),
          cartitem(),
          SizedBox(height: 5,),
          cartitem(),
          SizedBox(height: 5,),
          cartitem(),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Sub Total'),
              Text('100\$')
            ],),
          ),
          SizedBox(height: 3,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Delivery Fee'),
              Text('10\$')

            ],),
          )
          ,
          

          Divider(thickness: 2,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),),
                Text('110\$',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),)

              ],),
          ),

SizedBox(height: 18,),
          CustomElevatedButton(label: 'Checkout', onPressed: () {
            Navigator.pushNamed(context, RoutesNames.checkoutPage);
          },)

        ],
      ),
    );
  }
}