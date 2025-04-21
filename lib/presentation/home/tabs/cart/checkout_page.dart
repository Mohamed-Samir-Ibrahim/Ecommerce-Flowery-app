import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/core/utils/resources/validator_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime arriveTime = DateTime.now().add(Duration(minutes: 30));
    String formattedArriveTime = DateFormat(
      'dd MMM y, hh:mm a',
    ).format(arriveTime);
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery time",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Schedule",
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.schedule),
                  SizedBox(width: 4.w),
                  Text(
                    "Instant,",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    " Arrive by $formattedArriveTime",
                    style: TextStyle(
                      color: ColorManager.Green,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorManager.dividerWhite,
              thickness: 24.h,
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Text(
                "Delivery address",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Card(
                color: ColorManager.white,
                shadowColor: Color(0xFF535353),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio<bool>(
                                value: true,
                                activeColor: ColorManager.primary,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: ColorManager.primary,
                                fillColor: WidgetStatePropertyAll(
                                  ColorManager.primary,
                                ),
                                groupValue: true,
                                onChanged: (value) {
                                  // _authCubit.onChooseAccountType(value!);
                                },
                              ),

                              Text(
                                "Home",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Text(
                              "2XVP+XC - Sheikh Zayed",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: ColorManager.darkGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.mode_edit_outline_outlined),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Card(
                color: ColorManager.white,
                shadowColor: Color(0xFF535353),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio<bool>(
                                value: true,
                                activeColor: ColorManager.primary,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: ColorManager.primary,
                                fillColor: WidgetStatePropertyAll(
                                  ColorManager.primary,
                                ),
                                groupValue: false,
                                onChanged: (value) {
                                  // _authCubit.onChooseAccountType(value!);
                                },
                              ),

                              Text(
                                "Office",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Text(
                              "2XVP+XC - Sheikh Zayed",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: ColorManager.darkGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.mode_edit_outline_outlined),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: ColorManager.primary, size: 25.r),
                    Text(
                      "Add new",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12.w),
                  foregroundColor: ColorManager.primary,
                  backgroundColor: ColorManager.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorManager.white70),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),
            Divider(
              color: ColorManager.dividerWhite,
              thickness: 24.h,
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Text("Payment method",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Card(
                color: ColorManager.white,
                shadowColor: Color(0xFF535353),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0.w),
                  child: Row(
                    children: [

                      Text(
                        "Cash on delivery ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                      Spacer(),
                      Radio<bool>(
                        value: true,
                        activeColor: ColorManager.primary,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        hoverColor: ColorManager.primary,
                        fillColor: WidgetStatePropertyAll(
                          ColorManager.primary,
                        ),
                        groupValue: true,
                        onChanged: (value) {
                          // _authCubit.onChooseAccountType(value!);
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Card(
                color: ColorManager.white,
                shadowColor: Color(0xFF535353),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0.w),
                  child: Row(
                    children: [

                      Text(
                        "Credit card",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                      Spacer(),
                      Radio<bool>(
                        value: true,
                        activeColor: ColorManager.primary,
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        hoverColor: ColorManager.primary,
                        fillColor: WidgetStatePropertyAll(
                          ColorManager.primary,
                        ),
                        groupValue: true,
                        onChanged: (value) {
                          // _authCubit.onChooseAccountType(value!);
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: ColorManager.dividerWhite,
              thickness: 24.h,
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  Switch(
                    activeColor: ColorManager.white,
                    activeTrackColor: ColorManager.primary,
                    value: true,
                    onChanged: (value) {
                      if (value) {
                      } else {}
                    },
                  ),
                  SizedBox(width: 4.w,),
                  Text("It is a gift",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomTextFormField(
                validator: ValidatorManager.firstName,

                hintText: "Enter your name",
                labelText: "Name",
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomTextFormField(
                validator: ValidatorManager.firstName,

                hintText: "Enter the phone number",
                labelText: "Phone number",
              ),
            ),
            Divider(
              color: ColorManager.dividerWhite,
              thickness: 24.h,
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Sub Total",style: TextStyle(fontSize: 16.sp),), Text("100\$",style: TextStyle(fontSize: 16.sp),)],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Delivery Fee",style: TextStyle(fontSize: 16.sp),), Text("10\$",style: TextStyle(fontSize: 16.sp),)],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Divider(color: ColorManager.grey, height: 1.h),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                  Text("110\$", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp)),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: CustomElevatedButton(
                label: "Place Order",
                onPressed: () {},
              ),
            ),
            SizedBox(height: 60.h,),
          ],
        ),
      ),
    );
  }
}
