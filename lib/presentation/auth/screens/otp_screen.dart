import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flowery/presentation/auth/cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../core/utils/resources/string_manager.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final viewModel = getIt.get<AuthViewModel>();

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text(StringManager.password.tr())),
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


              Navigator.pushNamed(context, RoutesNames.resetPassWord,
                arguments: viewModel.emailController.text,);


            } else if (state.status == Status.error &&
                state.exception != null) {
              Navigator.pop(context);

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title:  Text(StringManager.error.tr()),
                    content: Text(state.verifyResetResponse?.error ?? ""),
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
                  Text(StringManager.emailVerification.tr()),
                  SizedBox(height: 10.h),
                  Text(
                    StringManager.enterCodeVerification.tr(),
                  ),
                  SizedBox(height: 20.h),
                  Pinput(
                    length: 6,
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofocus: true,
                    controller: viewModel.otpCodeController,
                    onCompleted: (value) {
                      viewModel.otpCodeController.text = value;
                      viewModel.doIntent(VerifyResetIntent());
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
                      Text(StringManager.didNotReceiveCode.tr()),
                      TextButton(
                        onPressed: () {
                          // authViewModel.emailController.clear();
                          viewModel.doIntent(ForgetPasswordIntent());

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(StringManager.codeHasBeResend.tr())),
                          );

                        },
                        child: Text(StringManager.resend.tr(),style: TextStyle(color: ColorManager.primary),),
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
