import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onPressed;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  const CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.textStyle,
    this.isStadiumBorder = true,
    this.backgroundColor,
    this.radius,
    this.suffixIcon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: isStadiumBorder
              ? const StadiumBorder()
              : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: backgroundColor ?? ColorManager.primary,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(
              width: 24.w,
            ),
            Text(
              label,
              style: textStyle ??
                  TextStyle(color: ColorManager.white,fontSize: 12.sp,fontWeight: FontWeight.w500)
                      .copyWith(fontSize: 20.sp),
            ),
            SizedBox(
              width: 27.w,
            ),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}