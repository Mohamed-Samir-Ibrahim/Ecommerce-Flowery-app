import 'package:flowery/data/model/auth_model/signup/signup_response.dart';
import 'package:flowery/di/injetible_intinalizer.dart';
import 'package:flowery/domain/entity/auth_entity/signup/signup_entity.dart';
import 'package:flowery/presentation/auth/cubit/auth_intent.dart';
import 'package:flowery/presentation/auth/cubit/auth_states.dart';
import 'package:flowery/presentation/auth/cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/custom_elevated_button.dart';
import '../../../../core/utils/resources/main_text_field.dart';
import '../../../../core/utils/resources/string_manager.dart';
import '../../../../core/utils/resources/styles_manager.dart';
import '../../../../core/utils/resources/validator_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../core/utils/resources/font_manager.dart';
import '../../../core/utils/routes/routes_names.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
AuthViewModel authViewModel = getIt<AuthViewModel>();
class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 28),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("Sign Up"),
            ),
            backgroundColor: ColorManager.white,
            body: BlocConsumer<AuthViewModel,AuthStates>(
              listener: (context,state){
           switch(state){
             case AuthInitialStates():{

             }
             case SignUpSuccessState():{
               DialogUtlis.showMessageDialog(context, message: 'Success');

             }
             case SignUpErrorState():{
               DialogUtlis.showMessageDialog(context, message: authViewModel.signupEntity?.message??'error');



             }
             case SignUpLoadingState():
              DialogUtlis.showLoadingDialog(context, message: 'Loading..');
           }

                
              },
bloc: authViewModel..dointent,

              builder: (BuildContext context, state) {

                return Padding(
                    padding: const EdgeInsets.all(PaddingManager.p8),
                    child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Expanded(

                                        child: CustomTextFormField(
                                  controller: authViewModel.fristName,
                                          hintText: 'Enter your frist name',
                                         fillColour : ColorManager.white,
                                          labelText: StringManager.firstName,
                                        ),
                                      ),
                                      SizedBox(
                                        width: FontSize.s12,
                                      ),
                                      Expanded(
                                        child: CustomTextFormField(
                                          controller: authViewModel.lastname,
                                          hintText: 'Enter your last name',

                                          fillColour: ColorManager.white,
                                          labelText: StringManager.lastName,

                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: FontSize.s20.h),

                                  CustomTextFormField(
                                    controller: authViewModel.email,
                                    hintText: 'Enter your email address',
                                    fillColour: ColorManager.white,
                                    labelText: StringManager.email,
                                  ),
                                  SizedBox(height: FontSize.s20.h),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          controller: authViewModel.password,
                                          hintText: 'Enter password',
                                          fillColour: ColorManager.white,
                                          labelText: 'Password',
                                          validator: ValidatorManager.validatePassword,
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                      )
                                      ,
                                      SizedBox(
                                        width: SizeManager.s10,
                                      ),
                                      Expanded(
                                        child: CustomTextFormField(
                                          controller: authViewModel.rePassword,
                                          hintText: 'confirm password',
                                          fillColour: ColorManager.white,
                                          labelText: 'Confirm password',
                                          validator: ValidatorManager.validatePassword,
                                          obscureText: true,
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                      )
                                    ],
                                  )
                                  ,
                                  SizedBox(height: SizeManager.s20.h),

                                  CustomTextFormField(
                                    controller: authViewModel.phone,
                                    keyboardType: TextInputType.phone,
                                    hintText: 'Enter phone number',
                                    labelText: 'Phone Number',
                                    fillColour: ColorManager.white,
                                  ),


                                  SizedBox(height: SizeManager.s20.h),


                                  Row(
                                    children: [
                                      Text('Gender',
                                        style: TextStyle(
                                            fontSize: SizeManager.s20,
                                            fontWeight:FontWeight.bold
                                        ),),
                                      Radio(


                                          focusColor: ColorManager.primary,
                                          value: "male", groupValue: authViewModel.SelectedGender, onChanged: (val){
                                        authViewModel.SelectedGender=val!;
                                        setState(() {

                                        });
                                      }),
                                      Text('Male',style: TextStyle(
                                          fontSize: SizeManager.s14          ),),
                                      Radio(value: "female", groupValue:authViewModel.SelectedGender, onChanged: (val){
                                        authViewModel.SelectedGender=val!;
                                        setState(() {

                                        });
                                      }),
                                      Text('Female',style: TextStyle(
                                          fontSize: SizeManager.s14          ),),
                                    ],
                                  ),
                                  SizedBox(height: SizeManager.s20.h),

                                  Row(
                                    children: [
                                      Text('    Creating an account, you agree to our '),
                                      GestureDetector(
                                          onTap: (){},
                                          child: Text('Terms&Conditions',style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),))
                                    ],
                                  ),

                                  SizedBox(height: SizeManager.s20.h),

                                  CustomElevatedButton(
                                    isStadiumBorder: false,
                                    label: StringManager.signup,
                                    backgroundColor: ColorManager.primary,
                                    textStyle: getBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: SizeManager.s18,
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        authViewModel.dointent(SignUpIntent());


                                      }
                                       // Navigator.pushNamedAndRemoveUntil(
                                       // context, RoutesNames.layout, (route) => false);
                                    },
                                  ),
                                ]))));

              },

            )));
  }
}
