import 'package:easy_localization/easy_localization.dart';
import 'package:flowery/core/utils/resources/string_manager.dart';
import 'package:flutter/material.dart';
ValueNotifier<bool> valid = ValueNotifier(false);
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> passwordConfirmationVisible = ValueNotifier(true);
enum Gender { male, female }
Gender selectedGender = Gender.female;
class ValidatorManager {
  static String? firstName(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourFirstName  ;
    }else if(!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(value)){
    return StringManager.firstNameError.tr();
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourLastName.tr()  ;
    }else if(!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(value)){
    return StringManager.lastNameError;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourEmail.tr()  ;
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return StringManager.emailError.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    var regex = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (value == null || value.isEmpty) {
      return StringManager.enterYourPassword.tr();
    }
    if (!regex.hasMatch(value)) {
      return StringManager.passwordError.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value,String? passwordvalue) {
     RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (value == null || value.isEmpty) {
      return StringManager.enterYourPassword.tr();
    }
    if (passwordvalue == null || passwordvalue.isEmpty) {
      return StringManager.passwordError.tr();
    }
    if (value != passwordvalue) {
      return StringManager.rePasswordNotFound.tr();
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourConfirmPassword.tr() ;
    }
    final phoneRegex = RegExp(r'^\+20(10|11|12|15)\d{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return StringManager.phoneNumberError.tr();
    }
    return null;
  }

  void changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void changeGender(Gender value) {
    selectedGender = value;
  }

   void changePasswordConfirmationVisibility() {
    passwordConfirmationVisible.value = !passwordConfirmationVisible.value;
  }
}