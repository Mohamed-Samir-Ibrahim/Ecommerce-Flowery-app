import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flowery/core/utils/resources/styles_manager.dart';
import 'package:flowery/core/utils/resources/validator_manager.dart';
import 'package:flowery/core/utils/resources/values_manager.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flowery/presentation/auth/cubit/auth_view_model.dart';
import 'package:flowery/presentation/home/tabs/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool isChecked = false;
  // final TextEditingController emailloginController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authViewModel = getIt.get<AuthViewModel>();
    final home = getIt<HomeViewModel>();
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

    return SafeArea(
      child: BlocProvider(
        create: (context) => authViewModel,
        child: Scaffold(
          appBar: AppBar(

            title: Text("Login"),
          ),
          backgroundColor: ColorManager.white,
          body: BlocConsumer<AuthViewModel, AuthState>(
              listener: (context, state) {
                if (state.status != Status.loading) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                }
                if (state.status == Status.loading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                } else if (state.status == Status.success &&
                    state.obj_login_response != null) {
                  Navigator.pushNamed(context, RoutesNames.bottomNavScreen);

                } else if (state.status == Status.error &&
                    state.exception != null) {
                  print("Login Error: ${state.exception}");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: Text((state.exception.toString())),
                      );
                    },
                  );
                }
              },
              builder: (context, state) {return Padding(
                padding: const EdgeInsets.all(PaddingManager.p8),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller:authViewModel.emailloginController,
                          hintText: 'Enter your email address',
                          labelText: StringManager.email,
                          validator: ValidatorManager.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: SizeManager.s28.h),
                        CustomTextFormField(
                          controller: authViewModel.passwordController,
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
                              value: authViewModel.isChecked,
                              onChanged: (value) {
                                setState(() {
                                  authViewModel.isChecked = value!;
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

                                      authViewModel.doIntent(LoginResetIntent());


                                  },
                                ),
                                SizedBox(height: SizeManager.s10.h),
                                CustomElevatedButton(
                                  isStadiumBorder: false,
                                  label: StringManager.continueasguest,
                                  backgroundColor: const Color.fromARGB(255,255,255, 255,),
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
              );}

          ),
        ),
      ),
    );
  }
}