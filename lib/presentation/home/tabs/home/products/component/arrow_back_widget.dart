import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ArrowBackWidget(BuildContext context) {
  return Positioned(
      top: 50.h,
      left: 16.w,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          size: 24.r,
          color: ColorManager.black,
        ),
      ));
}