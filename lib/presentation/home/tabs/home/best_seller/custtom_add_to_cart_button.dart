import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CusttomAddToCartButton extends StatelessWidget {
  const CusttomAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 147,
      height: 30,
      child: FilledButton(
        style:FilledButton.styleFrom(
          backgroundColor: ColorManager.primary
        ), onPressed: () {  }, child: Row(
        children: [
          Image.asset('assets/icon/shoppingcart.png',color: ColorManager.white,),
          Text('Add to cart',style: TextStyle(fontSize: 13,color: ColorManager.white),)
        ],
      ),
        ),

    );
  }
}
