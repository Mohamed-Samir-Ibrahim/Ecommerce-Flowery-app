import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flowery/core/utils/resources/font_manager.dart';
import 'package:flowery/core/utils/resources/main_text_field.dart';
import 'package:flowery/core/utils/resources/styles_manager.dart';
import 'package:flowery/core/utils/resources/validator_manager.dart';
import 'package:flowery/core/utils/resources/values_manager.dart';
import 'package:flowery/presentation/home/tabs/profile/chang_password.dart';
import 'package:flowery/presentation/home/tabs/profile/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery/presentation/home/tabs/profile/profile_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedGender = 'female';

  @override
  void initState() {
    super.initState();
    // Fetch user data on init
    context.read<Profileviewmodel>().getloggeduserdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Edit Profile", style: getBoldStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: ColorManager.white,
          elevation: 0,
        ),
        body: BlocConsumer<Profileviewmodel, ProfileStates>(
          listener: (context, state) {
            if (state.status == ProfileStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Something went wrong")),
              );
            } else if (state.status == ProfileStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Profile updated successfully")),
              );
            }
          },
          builder: (context, state) {
            if (state.status == ProfileStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }

            final userData = state.obj_user_LoggedUserDataResponse_entity?.firstOrNull;

            if (userData == null) {
              return Center(child: Text("No user data found"));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(PaddingManager.p16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: AssetImage("assets/images/profile_placeholder.png"),
                        ),
                        CircleAvatar(
                          radius: 16.r,
                          backgroundColor: ColorManager.primary,
                          child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                        )
                      ],
                    ),
                    SizedBox(height: SizeManager.s20.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'First name',
                            labelText: 'First name',
                            fillColour: ColorManager.white,
                            initialValue: userData.firstName ?? '',
                          ),
                        ),
                        SizedBox(width: SizeManager.s10),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: 'Last name',
                            labelText: 'Last name',
                            fillColour: ColorManager.white,
                            initialValue: userData.lastName ?? '',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeManager.s20.h),

                    CustomTextFormField(
                      hintText: 'Email',
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      fillColour: ColorManager.white,
                      initialValue: userData.email ?? '',
                    ),
                    SizedBox(height: SizeManager.s20.h),

                    CustomTextFormField(
                      hintText: 'Phone number',
                      labelText: 'Phone number',
                      keyboardType: TextInputType.phone,
                      fillColour: ColorManager.white,
                      initialValue: userData.phone ?? '',
                    ),
                    SizedBox(height: SizeManager.s20.h),

                    Stack(
                      children: [
                        CustomTextFormField(
                          hintText: 'Password',
                          labelText: 'Password',
                          obscureText: true,
                          validator: ValidatorManager.validatePassword,
                          fillColour: ColorManager.white,
                        ),
                        Positioned(
                          right: 10,
                          top: 18,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Change",
                              style: getBoldStyle(
                                  color: ColorManager.primary, fontSize: FontSize.s14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeManager.s20.h),

                    Row(
                      children: [
                        Text("Gender", style: getBoldStyle(fontSize: FontSize.s16, color: ColorManager.primary)),
                        SizedBox(width: SizeManager.s10),
                        Radio<String>(
                          value: 'female',
                          groupValue: selectedGender,
                          onChanged: (val) {
                            setState(() => selectedGender = val!);
                          },
                        ),
                        Text("Female"),
                        Radio<String>(
                          value: 'male',
                          groupValue: selectedGender,
                          onChanged: (val) {
                            setState(() => selectedGender = val!);
                          },
                        ),
                        Text("Male"),
                      ],
                    ),
                    SizedBox(height: SizeManager.s28.h),

                    CustomElevatedButton(
                      label: 'Update',
                      backgroundColor: ColorManager.primary,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                         // context.read<Profileviewmodel>().updateProfile
                          (
                            firstName: userData.firstName ?? '',
                            lastName: userData.lastName ?? '',
                            email: userData.email ?? '',
                            phone: userData.phone ?? '',
                            gender: selectedGender,
                          );
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
