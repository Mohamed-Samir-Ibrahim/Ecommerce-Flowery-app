import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/presentation/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/dialog_utils.dart';
import '../../../core/utils/resources/custom_elevated_button.dart';
import '../../../core/utils/resources/main_text_field.dart';
import '../../../core/utils/resources/string_manager.dart';
import '../../../core/utils/routes/routes_names.dart';
import '../../../di/injetible_intinalizer.dart';
import '../cubit/auth_view_model.dart';

class ResetPasswordScreen extends StatefulWidget {

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthViewModel viewModel = getIt<AuthViewModel>();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final email = ModalRoute.of(context)?.settings.arguments as String?;
  //   if (email != null) {
  //     viewModel.setEmail(email);
  //
  //   } else {
  //
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child:
      BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state.status == Status.loading) {
            DialogUtils.showLoadingDialog(context, message: 'Loading...');
          } else {
            DialogUtils.hideLoadingDialog(context);
          }

          if (state.status == Status.success&&state.resetPasswordResponse!=null) {
            DialogUtils.showMessageDialog(
              context,
              message: 'errorrrrrrr',
              posTitle: 'OK',
              posAction: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesNames.loginScreen,
                      (route) => false,
                );
              },
            );
          } else if (state.status == Status.error&&state.exception  != null) {
            DialogUtils.showMessageDialog(
              context,
              message: state.resetPasswordResponse?.error??"Operation successful",
              posTitle: 'Try Again',
            );
          }
        },
        builder: (context, state) {

          return Scaffold(
            appBar: AppBar(
              title: const Text('Password'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              backgroundColor: ColorManager.white60,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            StringManager.resetPassword,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            StringManager.passwordError,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorManager.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomTextFormField(
                      labelText:StringManager.password,
                      hintText: StringManager.enterYourPassword,
                      controller: viewModel.newPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringManager.enterYourPassword;
                        }
                        if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
                            .hasMatch(value)) {
                          return StringManager.passwordError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      labelText: StringManager.confirmPassword,
                       hintText: StringManager.confirmPassword,
                      controller: viewModel.confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringManager.confirmPassword;
                        }
                        if (value != viewModel.newPasswordController.text) {
                          return StringManager.rePasswordError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child:
                      CustomElevatedButton(
                        label: "Continue",
                        onPressed: () {
                          if(viewModel.formKey.currentState!.validate()){
                            viewModel.doIntent(ResetPasswordIntent());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
