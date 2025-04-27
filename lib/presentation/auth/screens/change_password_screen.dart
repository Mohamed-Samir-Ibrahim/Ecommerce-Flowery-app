import 'package:flowery/core/utils/resources/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/resources/main_text_field.dart';
import '../../../di/injetible_intinalizer.dart';
import '../../home/tabs/profile/profile_states.dart';
import '../../home/tabs/profile/profile_view_model.dart';

class ChangePasswordScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Change Password'),
  ),
  body:
  BlocProvider(create: (context) => getIt<ProfileViewModel>(),
  child: BlocBuilder<ProfileViewModel, ProfileState>(
    builder: (context, state) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: context.read<ProfileViewModel>().passwordController,
              labelText: 'Old Password',
              hintText: 'Enter your old password',
              obscureText: true,
              fillColour: Colors.white,

            ),
            CustomTextFormField(
              controller: context.read<ProfileViewModel>().newPasswordController,
              labelText: 'New Password',
              hintText: 'Enter your new password',
              obscureText: true,
              fillColour: Colors.white,
            ),
            CustomTextFormField(
              controller: context.read<ProfileViewModel>().newPasswordController,
              labelText: 'Confirm Password',
              hintText: 'Confirm your new password',
              obscureText: true,
              fillColour: Colors.white,),
            SizedBox(height: 16.0),
            CustomElevatedButton(label: 'Change Password', onPressed: (){
              context.read<ProfileViewModel>().doIntent(ChangePasswordIntent());
            })
        ]
        ),
      );
    },
  ),),
);
  }
}