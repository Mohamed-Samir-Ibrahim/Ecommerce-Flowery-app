import 'package:flowery/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.filled,
    this.readOnly,
    this.validator,
    this.fillColour,
    this.suffixIcon,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.prefixIcon,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.height,
    this.width,
    this.labelText,
    this.autofocus = false,
    this.inputFormatters = const [],
    this.obscureText,
    this.fontSize,
    this.initialValue, // ✅ تم الإضافة هنا
  });

  final String? Function(String?)? validator;
  final Function? onChanged;
  final TextEditingController? controller;
  final bool? filled;
  final Color? fillColour;
  final bool? obscureText;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final int? maxLength;
  final int? maxLines;
  final double? height;
  final double? width;
  final double? fontSize;
  final bool autofocus;
  final List<TextInputFormatter> inputFormatters;
  final String? initialValue; // ✅ تم الإضافة هنا

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      initialValue: controller == null ? initialValue : null, // ✅ شرط عدم وجود controller
      cursorColor: ColorManager.grey,
      style: TextStyle(
        fontSize: fontSize ?? 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.grey,
      ),
      validator: validator == null ? null : (value) => validator!(value),
      onChanged: onChanged == null ? (value) {} : (value) => onChanged!(value),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      maxLength: maxLength,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        counterText: '',
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ColorManager.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: ColorManager.red),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        filled: filled,
        fillColor: fillColour,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.grey,
        ),
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xffA6A6A6),
            ),
        errorStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.red,
        ),
      ),
    );
  }
}
