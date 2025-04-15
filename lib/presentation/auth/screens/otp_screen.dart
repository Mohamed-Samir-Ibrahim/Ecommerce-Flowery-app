import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/data/model/auth_model/verify_reset/Verify_reset_response.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flowery/presentation/auth/cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = getIt.get<AuthViewModel>();

    return BlocProvider(
      create: (context) => authViewModel,
      child: Scaffold(
        appBar: AppBar(title: Text("Password")),
        body: BlocConsumer<AuthViewModel, AuthState>(
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
                state.verifyResetResponse != null) {
              Navigator.pop(context);

              print("succcccess");
            } else if (state.status == Status.error &&
                state.exception != null) {
              Navigator.pop(context);

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
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Text("Email verification"),
                  SizedBox(height: 10.h),
                  Text(
                    "Please enter your code that send to your email address ",
                  ),
                  SizedBox(height: 20.h),
                  Pinput(
                    length: 6,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofocus: true,
                    controller: authViewModel.otpCodeController,
                    onCompleted: (value) {
                      authViewModel.otpCodeController.text = value;
                      authViewModel.doIntent(VerifyResetIntent());
                    },
                    defaultPinTheme: PinTheme(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: ColorManager.white60,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  Row(
                    children: [
                      Text("Didn't receive code?"),
                      TextButton(
                        onPressed: () {
                          authViewModel.emailController.clear();
                          authViewModel.doIntent(ForgetPasswordIntent());

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("code has be resend")),
                          );

                        },
                        child: Text("Resend",style: TextStyle(color: ColorManager.primary),),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
