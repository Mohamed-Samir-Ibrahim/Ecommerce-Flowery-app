import 'package:flowery/core/utils/resources/string_manager.dart';

class ValidatorManager {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourEmail  ;
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$');
    if (!emailRegex.hasMatch(value)) {
      return StringManager.emailError;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.enterYourPassword;
    }
    if (value.length < 8) {
      return StringManager.passwordError;
    }
    return null;
  }
}