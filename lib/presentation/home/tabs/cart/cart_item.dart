import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/font_manager.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/domain/entity/cart_entity/cart_entity.dart';
import 'package:flowery/presentation/home/tabs/cart/cubit/Cart_states.dart';
import 'package:flowery/presentation/home/tabs/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/resources/custom_elevated_button.dart';

class cartitem extends StatefulWidget {
   cartitem({super.key, required this.cartI});
final CartItems? cartI;
  @override
  State<cartitem> createState() => _cartitemState();
}

class _cartitemState extends State<cartitem> {
CartViewModel cartViewModel = getIt<CartViewModel>();

int btn= 1;
@override
  void initState() {
  final productId = widget.cartI?.product?.id;
  if(productId!=null){
    Future.microtask(() =>    context.read<CartViewModel>().dointent(
      AddCartIntent(productid: productId, quantity: btn)));
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

  return Column(
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
      SizedBox(
        height: 117,
        width: double.infinity,
        child: Card(
          color: ColorManager.white,
          child: Row(
            children: [
              Image(image: NetworkImage(widget.cartI?.product?.imgCover??""),width: 101,height: 96,),
              Column(
                children: [
                  Row(
                    children: [
                      Text('${widget.cartI?.product?.title}',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.s18
                      ),),
                      SizedBox(width: MediaQuery.of(context).size.width*0.4,),

                      IconButton(onPressed: ()async{
                        final productId = widget.cartI?.product?.id;
                          await context.read<CartViewModel>().deletet(productId!);

                      }, icon: Icon(Icons.delete)),

                    ],
                  ),
                  Text(widget.cartI?.product?.description??"0",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: ColorManager.grey,
                        fontSize: FontSize.s14
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(widget.cartI?.price.toString()??'0',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),

                      Row(
                        children: [
                          IconButton(onPressed: (){
                            if(btn>1){
                              btn--;
                            }
                            setState(() {

                            });
                          }, icon: Icon(Icons.remove,size: 10,)),
                          Text('${btn}',style: TextStyle(fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            btn++;
                  setState(() {

                  });
                          }, icon: Icon(Icons.add,size: 10,)),
                        ],
                      ),


                    ],
                  )
                ],
              ),


            ],

          ),

        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub Total'),
            Text('${widget.cartI?.price}\$')
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
            Text('${widget.cartI?.price}\$',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),)

          ],),
      ),

      SizedBox(height: 18,),
      CustomElevatedButton(label: 'Checkout', onPressed: () {  },)],

  );
  }

}
