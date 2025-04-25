// import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
// import 'package:flowery/core/utils/resources/main_text_field.dart';
// import 'package:flutter/material.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({Key? key}) : super(key: key);

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final currentPasswordController = TextEditingController();
//   final newPasswordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   bool isLoading = false;

//   void _handleChangePassword() {
//     if (_formKey.currentState!.validate()) {
//       setState(() => isLoading = true);

//       // Simulate API call
//       Future.delayed(const Duration(seconds: 2), () {
//         setState(() => isLoading = false);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Password changed successfully!")),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Change Password"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               CustomTextFormField(
//                 controller: currentPasswordController,
//                 labelText: "Current Password",
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter current password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               CustomTextFormField(
//                 controller: newPasswordController,
//                 labelText: "New Password",
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               CustomTextFormField(
//                 controller: confirmPasswordController,
//                 labelText: "Confirm Password",
//                 obscureText: true,
//                 validator: (value) {
//                   if (value != newPasswordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 32),
//               isLoading
//                   ? const CircularProgressIndicator()
//                   : CustomElevatedButton(
//                       onPressed: _handleChangePassword, label: 'Change Password',
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/presentation/home/tabs/profile/change_password/change_password_cubit.dart';
import 'package:flowery/presentation/home/tabs/profile/change_password/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state.status == ChangePasswordStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password changed successfully')),
          );
        } else if (state.status == ChangePasswordStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.exception?.toString() ?? 'Error occurred')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Change Password"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: oldPasswordController,
                    labelText: "Current Password",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter current password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: newPasswordController,
                    labelText: "New Password",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    labelText: "Confirm Password",
                    obscureText: true,
                    validator: (value) {
                      if (value != newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  state.status == ChangePasswordStatus.loading
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                          onPressed: () {
                           if (_formKey.currentState!.validate()) {
    print('oldPassword: ${oldPasswordController.text}');
    print('newPassword: ${newPasswordController.text}');
    
    context.read<ChangePasswordCubit>().changePassword(
      oldPasswordController.text,
       newPasswordController.text,
    );
  }
                          },
                          label: 'Change Password',
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
