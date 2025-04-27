import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_view_model.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/main_text_field.dart';
import '../../../../core/utils/resources/string_manager.dart';
import '../../../../core/utils/resources/validator_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../core/utils/routes/routes_names.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) => getIt<ProfileViewModel>(),
      child: BlocListener<ProfileViewModel, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStates.success && state.editProfileEntity != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully')),
            );
            Navigator.pop(context);
          } else if (state.status == ProfileStates.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Error occurred')),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Edit profile'),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notifications
                    },
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: BlocBuilder<ProfileViewModel, ProfileState>(
            builder: (context, state) {
              final viewModel = context.read<ProfileViewModel>();

              // Load user data when the screen is initialized
              if (state.status == ProfileStates.initial) {
                viewModel.doIntent(GetLoggedUserIntent());
              }

              if (state.status == ProfileStates.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == ProfileStates.error) {
                return Center(child: Text(state.message ?? 'Error occurred'));
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Profile Picture
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            state.getLoggedUserDataEntity?.user?.photo ??
                                '',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // First Name and Last Name
                    Row(
                      children: [
                        Expanded(

                          child: CustomTextFormField(
                            controller: viewModel.firstNameController,
                            labelText: StringManager.firstName.tr(),
                            hintText: state.getLoggedUserDataEntity?.user?.firstName ?? '',
                            fillColour : ColorManager.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(

                          child: CustomTextFormField(
                            controller: viewModel.lastNameController,
                            labelText: StringManager.lastName.tr(),
                            hintText: state.getLoggedUserDataEntity?.user?.lastName ?? '',
                            fillColour : ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Email
                    CustomTextFormField(
                      controller: viewModel.emailController,
                      hintText:state.getLoggedUserDataEntity?.user?.email ?? '',
                      fillColour: ColorManager.white,
                      labelText:  StringManager.email.tr(),
                    ),
                    const SizedBox(height: 16),

                    // Phone Number
                    CustomTextFormField(
                      controller: viewModel.phoneController,
                      keyboardType: TextInputType.phone,
                      hintText:  state.getLoggedUserDataEntity?.user?.phone ?? '',
                      labelText:StringManager.phoneNumber.tr(),
                      fillColour: ColorManager.white,
                    ),
                    const SizedBox(height: 16),

                    // Password
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: viewModel.passwordController,
                            hintText: "*********",
                            fillColour: ColorManager.white,
                            labelText: StringManager.password.tr(),
                            validator: ValidatorManager.validatePassword,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: TextButton(
                             onPressed: () {
                               Navigator.pushNamed(context, RoutesNames.changePassWordScreen);
                             },
                             child: Text(StringManager.changePassword.tr()),

                            )
                          ),

                        ),
                        const SizedBox(width: 16),

                      ],
                    ),
                    const SizedBox(height: 16),

                    // Gender
                    Row(
                      children: [
                         Text(StringManager.gender.tr(), style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 20),
                        Radio<String>(
                          value: 'Female',
                          groupValue:state.getLoggedUserDataEntity?.user?.gender,
                          onChanged: (value) {
                            viewModel.selectedGender = value;
                          },
                          activeColor: Colors.pink,
                        ),
                        const Text('Female'),
                        const SizedBox(width: 20),
                        Radio<String>(
                          value: 'Male',
                          groupValue: state.getLoggedUserDataEntity?.user?.gender,
                          onChanged: (value) {
                            viewModel.selectedGender = value;
                          },
                          activeColor: Colors.pink,
                        ),
                        const Text('Male'),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Update Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.doIntent(EditProfileIntent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'UPDATE',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}