import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/custom_elevated_button.dart';
import '../../../../core/utils/resources/main_text_field.dart';
import '../../../../core/utils/resources/string_manager.dart';
import '../../../../core/utils/resources/styles_manager.dart';
import '../../../../core/utils/resources/validator_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _SelectedGender='female';
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
            body: Padding(
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

                                      hint: 'Enter your frist name',
                                      backgroundColor: ColorManager.white,
                                      label: StringManager.firstName,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeManager.s10,
                                  ),
                                  Expanded(
                                    child: CustomTextFormField(
                                      hint: 'Enter your last name',

                                      backgroundColor: ColorManager.white,
                                      label: StringManager.lastName,

                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: SizeManager.s20.h),

                              CustomTextFormField(
                                hint: 'Enter your email address',
                                backgroundColor: ColorManager.white,
                                label: StringManager.email,
                                validation: ValidatorManager.validateEmail,
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: SizeManager.s20.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      hint: 'Enter password',
                                      backgroundColor: ColorManager.white,
                                      label: 'Password',
                                      validation: ValidatorManager.validatePassword,
                                      isObscured: true,
                                      textInputType: TextInputType.visiblePassword,
                                    ),
                                  )
                                  ,
                                  SizedBox(
                                    width: SizeManager.s10,
                                  ),
                                  Expanded(
                                    child: CustomTextFormField(
                                      hint: 'confirm password',
                                      backgroundColor: ColorManager.white,
                                      label: 'Confirm password',
                                      validation: ValidatorManager.validatePassword,
                                      isObscured: true,
                                      textInputType: TextInputType.visiblePassword,
                                    ),
                                  )
                                ],
                              )
                              ,
                              SizedBox(height: SizeManager.s20.h),

                              CustomTextFormField(
                                textInputType: TextInputType.phone,
                                hint: 'Enter phone number',
                                label: 'Phone Number',
                                backgroundColor: ColorManager.white,
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
                                      value: "male", groupValue: _SelectedGender, onChanged: (val){
                                    _SelectedGender=val!;
                                    setState(() {

                                    });
                                  }),
                                  Text('Male',style: TextStyle(
                                      fontSize: SizeManager.s14          ),),
                                  Radio(value: "female", groupValue: _SelectedGender, onChanged: (val){
                                    _SelectedGender=val!;
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('تم التحقق بنجاح!')),
                                    );
                                  }
                                  //  Navigator.pushNamedAndRemoveUntil(
                                  //  context, RoutesNames.layout, (route) => false);
                                },
                              ),
                            ]))))));
  }
}
