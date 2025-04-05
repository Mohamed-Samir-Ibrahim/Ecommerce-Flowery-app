import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/resources/validator_manager.dart';
import 'package:flowery/core/utils/routes/routes_names.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flowery/presentation/auth/cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthViewModel viewModel = getIt<AuthViewModel>();

    return BlocProvider(
      create: (context) => viewModel,
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
                state.forgetPasswordResponse != null) {
              Navigator.pop(context);

              Navigator.pushNamed(context, RoutesNames.emailVerification,
                arguments: viewModel.emailController.text,
              );
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
                  Text("Forget Password"),
                  SizedBox(height: 10.h),

                  Text("Please enter your email associated to your account"),
                  SizedBox(height: 20.h),
                  CustomTextFormField(

                    controller: viewModel.emailController,
                    validator: ValidatorManager.validateEmail,

                    hintText: "Enter your email",
                    labelText: "Email",
                  ),
                  SizedBox(height: 48.h),

                  CustomElevatedButton(
                    label: "Confirm",
                    onPressed: () {
                      viewModel.doIntent(ForgetPasswordIntent());

                    },
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
