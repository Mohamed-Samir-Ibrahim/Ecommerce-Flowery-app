import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/resources/color_manager.dart';

class ProductItems extends StatelessWidget {
  final state;

  const ProductItems({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.white70, width: 0.5.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 147.w,
                      height: 131.h,
                      child:
                      state.products?.products != null &&
                          state.products?.products![index].imgCover !=
                              null &&
                          state
                              .products!
                              .products![index]
                              .imgCover!
                              .isNotEmpty
                          ? Image.network(
                        state.products!.products![index].imgCover!,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      )
                          : Placeholder(), // or SizedBox(), or a default image
                    ),
                    Text(
                      state.products?.products![index].title ?? "loading",
                      style: TextStyle(
                        fontSize: 16.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "${state.products?.products![index].priceAfterDiscount.toString()} " ??
                              "loading",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          "${state.products?.products![index].price.toString()}  " ??
                              "loading",
                          style: TextStyle(
                            color: ColorManager.lightGrey,
                            fontSize: 15.sp,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          state.products!.products![index].discount.toString() +
                              "%" ??
                              "loading",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorManager.white,
                          ),
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 8.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: state.products?.products?.length ?? 0,
      ),
    );
  }
}
