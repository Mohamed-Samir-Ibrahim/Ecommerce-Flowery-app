import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/font_manager.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flutter/material.dart';

class cartitem extends StatelessWidget {
  const cartitem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117,
      width: double.infinity,
      child: Card(
color: ColorManager.white,
        child: Row(
          children: [
Image(image: AssetImage('assets/icon/cart_icon.png'),width: 101,height: 96,),
            Column(
              children: [
                Row(
                  children: [
                    Text('Red roses',style: TextStyle(
fontWeight: FontWeight.bold,
                      fontSize: FontSize.s18
                    ),),
                        SizedBox(width: MediaQuery.of(context).size.width*0.4,),

                        IconButton(onPressed: (){}, icon: Icon(Icons.delete)),

                  ],
                ),
                Text('15 Pink Rose Bouquet',
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s14
                ),),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('600 EGP'),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),

                      Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                      Text('1'),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),

                    ],
                  )
                    ],
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
