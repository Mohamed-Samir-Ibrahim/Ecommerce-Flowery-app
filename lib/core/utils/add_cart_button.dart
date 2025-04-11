import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    super.key,
    required this.onTap,
    this.showRow = true,
    this.height ,
  });

  final VoidCallback onTap;
  final bool showRow;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: showRow
            ? Row(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: ColorManager.white,
                    size: 19,
                  ),
                  SizedBox(width: 8.w,),
                  Text(
                    'Add to cart',
                    style: TextStyle(color: ColorManager.white,fontSize: 13.sp,fontWeight: FontWeight.w500),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'Add to cart',
                  style:
                      TextStyle(color: ColorManager.white,fontSize: 16.sp,fontWeight: FontWeight.w500),
                ),
              ),
      ),
    );
  }
}