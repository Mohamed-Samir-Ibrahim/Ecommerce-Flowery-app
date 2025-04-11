
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/home/home_states.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../best_seller_states.dart';
import '../best_seller_view_model.dart';
import 'custtom_add_to_cart_button.dart';

class BestSellerPage extends StatelessWidget {
   BestSellerPage({super.key});

  BestSellerViewModel bestViewModel = getIt<BestSellerViewModel>();


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bestViewModel.dointent(BestSellerScreen());
    });    return BlocBuilder<BestSellerViewModel,BestSellerState>(
      bloc:bestViewModel ,
      builder: (BuildContext context, state) {

        if(state is IsLoadingBestSeller){
         return Center(child: CircularProgressIndicator());
        } if (state is SuccessBestSeller){
          final data = state.bestSellerEntity.besstSeller;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.white,
                title: ListTile(
                  title:        Text(StringManager.bestSeller,style: TextStyle(fontSize: 20),),
                  subtitle:  Text(StringManager.bestSellerDesc),
                )
            ),
            body: GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: data?.length,
              itemBuilder: (context,index){

              return   Container(
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      border: Border.all(color: Colors.black),

                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                          margin: EdgeInsets.all(6),
                  child: Column(

                      children: [
                        ClipRRect(

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)
                          ),

                          child:                         Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Image(image: NetworkImage("${data?[index].imgCover}",),width: double.infinity,fit: BoxFit.cover,height: 120,),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text("${data?[index].title}",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(

                                    fontSize: 12
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('EGP${data?[index].price} ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('${data?[index].priceAfterDiscount}',style: TextStyle(fontSize: 12),),
                              ),
                              Spacer(),
                              Text("${data?[index].discount}%",style: TextStyle(fontSize: 12,color: ColorManager.Green),)

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CusttomAddToCartButton(),
                        )
                      ])
              );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.80,crossAxisSpacing: 8,mainAxisSpacing: 8),),
          );
              }




        return CircularProgressIndicator();
      }

    );
  }
}
