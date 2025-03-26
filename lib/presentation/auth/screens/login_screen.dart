import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/core/utils/resources/styles_manager.dart';
import 'package:flowery/core/utils/resources/validator_manager.dart';
import 'package:flowery/core/utils/resources/values_manager.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>(); // مفتاح للنموذج

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 28),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
          title: Text("Login"),
        ),
        backgroundColor: ColorManager.white,
        body: Padding(
          padding: const EdgeInsets.all(PaddingManager.p8),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hintText: 'Enter your email address',
                    labelText: StringManager.email,
                    validator: ValidatorManager.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: SizeManager.s28.h),
                  CustomTextFormField(
                    hintText: 'Enter password',
                    labelText: 'Password',
                    validator: ValidatorManager.validatePassword,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: SizeManager.s8.h),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: SizeManager.s14.sp,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              RoutesNames.forgetPassword,
                            ),
                        child: Text(
                          'Forget password?',
                          style: getMediumStyle(
                            color: ColorManager.black,
                          ).copyWith(fontSize: SizeManager.s18.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeManager.s60.h),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                        children: [
                          CustomElevatedButton(
                            isStadiumBorder: false,
                            label: StringManager.login,
                            backgroundColor: ColorManager.primary,
                            textStyle: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: SizeManager.s18,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('تم التحقق بنجاح!')),
                                );
                              }
                              //  Navigator.pushNamedAndRemoveUntil(
                              //  context, RoutesNames.layout, (route) => false);
                            },
                          ),
                          SizedBox(height: SizeManager.s10.h),
                          CustomElevatedButton(
                            isStadiumBorder: false,
                            label: StringManager.continueAsGuest,
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            textStyle: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: SizeManager.s18,
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesNames.bottomNavScreen,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: getSemiBoldStyle(
                          color: ColorManager.black,
                        ).copyWith(fontSize: SizeManager.s16.sp),
                      ),
                      SizedBox(width: SizeManager.s8.w),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              RoutesNames.registerScreen,
                            ),
                        child: Text(
                          'Sign up',
                          style: getSemiBoldStyle(
                            color: ColorManager.primary,
                          ).copyWith(fontSize: SizeManager.s16.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
