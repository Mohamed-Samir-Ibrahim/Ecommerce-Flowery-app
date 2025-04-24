import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/core/utils/resources/validator_manager.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/data/model/payment_model/create_cash_order_model/creat_cash_order_response.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/cart/cart_states.dart';
import 'package:flowery/presentation/home/tabs/cart/cart_view_model.dart';
import 'package:flowery/presentation/home/tabs/cart/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CartViewModel cartViewModel = getIt.get<CartViewModel>();
  @override
  void initState() {
    super.initState();
    cartViewModel.doIntent(GetLoggedUserAddressIntent());
  }
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
      body: BlocListener<CartViewModel, CartStates>(
        bloc: cartViewModel,
        listener: (context, state) {
          if (state.status == Status.loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          } else if (state.status == Status.success &&
              cartViewModel.isCashOrder &&state.cashOrderResponse!=null) {
            Navigator.pushReplacementNamed(context, RoutesNames.orderPage);
          } else if (state.status == Status.success &&
              cartViewModel.isCashOrder == false&&state.checkoutSessionResponse!=null) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return PaymentWebViewPage(url: state.checkoutSessionResponse?.session?.url);
            },));
          } else if (state.status == Status.error && state.exception != null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(StringManager.error.tr()),
                  content: Text((state.exception.toString())),
                );
              },
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.deliveryTime.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        StringManager.schedule.tr(),
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
                      StringManager.instant.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      " ${StringManager.arriveBy.tr()} $formattedArriveTime",
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
                  StringManager.deliveryAddress.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              BlocBuilder<CartViewModel, CartStates>(
                bloc: cartViewModel,
                builder: (context, state) {
                  switch (state.status) {
                    case Status.loading:
                      {
                        return Center(child: CircularProgressIndicator());
                      }
                    case Status.error:
                      {
                        return Center(
                          child: TextButton(
                            onPressed: () {
                              cartViewModel.doIntent(
                                GetLoggedUserAddressIntent(),
                              );
                            },
                            child: Text(StringManager.error.tr()),
                          ),
                        );
                      }
                    case Status.success:
                      {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true
                          ,
                          itemBuilder: (context, index) {
                            final address =
                                state
                                    .getLoggedUserAddressResponse!
                                    .addresses![index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0.w,
                              ),
                              child: Card(
                                color: ColorManager.white,
                                shadowColor: Color(0xFF535353),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio<int>(
                                                value: index,
                                                activeColor:
                                                    ColorManager.primary,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                hoverColor:
                                                    ColorManager.primary,
                                                fillColor:
                                                    WidgetStatePropertyAll(
                                                      ColorManager.primary,
                                                    ),
                                                groupValue:
                                                    cartViewModel
                                                        .selectedAddressIndex,
                                                onChanged: (value) {
                                               setState(() {
                                                 cartViewModel
                                                     .selectedAddressIndex =
                                                     value!;
                                                 cartViewModel.selectedAddress=state
                                                     .getLoggedUserAddressResponse!
                                                     .addresses![value!];
                                               });
                                                },
                                              ),

                                              Text(
                                                address.city!,
                                                style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w500,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.0.w,
                                            ),
                                            child: Text(
                                              address.street!,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color:
                                                    ColorManager.darkGrey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.mode_edit_outline_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount:
                              state
                                  .getLoggedUserAddressResponse
                                  ?.addresses
                                  ?.length ??
                              0,
                        );
                      }
                  }
                },
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
                        StringManager.addNew.tr(),
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
                child: Text(
                  StringManager.paymentMethod.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
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
                          StringManager.cashOnDelivery.tr(),
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
                          groupValue: cartViewModel.isCashOrder,
                          onChanged: (value) {
                            setState(() {
                              cartViewModel.isCashOrder = value!;
                            });
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
                          StringManager.creditCard.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        Spacer(),
                        Radio<bool>(
                          value: false,
                          activeColor: ColorManager.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          hoverColor: ColorManager.primary,
                          fillColor: WidgetStatePropertyAll(
                            ColorManager.primary,
                          ),
                          groupValue: cartViewModel.isCashOrder,
                          onChanged: (value) {
                            setState(() {
                              cartViewModel.isCashOrder = value!;
                            });
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
                    SizedBox(width: 4.w),
                    Text(
                      StringManager.itIsAGift.tr(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: CustomTextFormField(
                  validator: ValidatorManager.firstName,

                  hintText: StringManager.enterYourName.tr(),
                  labelText: StringManager.name.tr(),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: CustomTextFormField(
                  validator: ValidatorManager.firstName,

                  hintText: StringManager.enterYourPhoneNumber.tr(),
                  labelText: StringManager.phoneNumber.tr(),
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
                  children: [
                    Text(
                      StringManager.subTotal.tr(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text("100\$", style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.deliveryFee.tr(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text("10\$", style: TextStyle(fontSize: 16.sp)),
                  ],
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
                    Text(
                      StringManager.total.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "110\$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: CustomElevatedButton(
                  label: StringManager.placeOrder.tr(),
                  onPressed: () {
                    cartViewModel.isCashOrder? cartViewModel.doIntent(
                      CreateCashOrderIntent(),
                    ): cartViewModel.doIntent(
                      CheckoutSessionIntent(),
                    );
                  },
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
