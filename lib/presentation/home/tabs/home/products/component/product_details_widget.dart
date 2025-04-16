import 'package:flowery/core/utils/add_cart_button.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';

import 'package:flowery/data/model/home_model/best_seller_response_dto.dart';

import 'package:flowery/domain/entity/home_entity/best_seller_entity/best_seller_entity.dart';

import 'package:flowery/presentation/home/tabs/home/products/component/slider_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, this.product});
  final BestSeller? product;

  @override
  Widget build(BuildContext context) {
    final bestSellerDto = ModalRoute.of(context)?.settings.arguments as BestSellerDto?;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderImage(
          imageUrls: product?.images ?? [],
        ),
        SizedBox(height:16.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EGP ${product?.priceAfterDiscount??0}',
                    style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Text('Status: ', style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                      Text('In stock', style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ],
              ),
              SizedBox(height:4.h,),
              Text('All prices include tax',
                  style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,color: ColorManager.grey,)),
              SizedBox(height:8.h,),
              Text(
                '${product?.quantity??0} ${product?.title??'UnKnown'}',
                style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
              ),
              SizedBox(height:24.h,),
              Text(
                'Description',
                maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
              ),
              SizedBox(height:8.h,),
              Text(product?.description ?? 'UnKnown',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
              SizedBox(height:24.h,),
              Text(
                'Bouquet include',
                style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),
              ),
              SizedBox(height:8.h,),
              Text('${product?.title??'UnKnown'}:${product?.quantity??0}',
                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
              SizedBox(height:4.h,),
              Text('White wrap', style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
              SizedBox(height:24.h,),
              AddCartButton(
                onTap: () {},
                height: 48.h,
                showRow: false,
              ),
              SizedBox(height:12.h,),
            ],
          ),
        ),
      ],
    );
  }
}