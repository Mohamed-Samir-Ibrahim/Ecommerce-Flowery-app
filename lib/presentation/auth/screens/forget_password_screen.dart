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
    final authViewModel = getIt.get<AuthViewModel>();
    final _formKey = GlobalKey<FormState>();
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
                state.forgetPasswordResponse != null) {
              Navigator.pop(context);

              Navigator.pushNamed(context, RoutesNames.emailVerification);
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Text("Forget Password"),
                    SizedBox(height: 10.h),

                    Text("Please enter your email associated to your account"),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      controller: authViewModel.emailController,
                      hintText: "Enter your email",
                      labelText: "Email",
                      validator: ValidatorManager.validateEmail,
                    ),
                    SizedBox(height: 48.h),

                    CustomElevatedButton(
                      label: "Confirm",
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          authViewModel.doIntent(ForgetPasswordIntent());
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
