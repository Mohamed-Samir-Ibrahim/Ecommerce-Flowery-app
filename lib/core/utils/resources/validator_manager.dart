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
    return StringManager.firstName;
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourLastName  ;
    }else if(!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(value)){
    return StringManager.lastName;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourEmail  ;
    }
    final emailRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]');
    if (!emailRegex.hasMatch(value)) {
      return StringManager.emailError;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    var regex = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (value == null || value.isEmpty) {
      return StringManager.enterYourPassword;
    }
    if (!regex.hasMatch(value)) {
      return StringManager.passwordError;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value,String? passwordvalue) {
    var regex = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (value == null || value.isEmpty) {
      return StringManager.enterYourPassword;
    }
    if (passwordvalue == null || passwordvalue.isEmpty) {
      return StringManager.passwordError;
    }
    if (value != passwordvalue) {
      return StringManager.rePasswordError;
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.confirmPassword ;
    }
    final phoneRegex = RegExp(r'^\+20(10|11|12|15)\d{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return StringManager.phoneNumberError;
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