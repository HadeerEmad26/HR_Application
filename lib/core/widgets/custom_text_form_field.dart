import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.validate,
    this.isPassword = false,
    this.icon,
    this.preIcon,
    this.suffixIconOnPressed,
    this.keyboardType,
    this.hintColorStyle,
  });
  final TextEditingController controller;
  final String? hint;
  final Color? hintColorStyle;
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final bool isPassword;
  final IconData? icon;
  final IconData? preIcon;
  final VoidCallback? suffixIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: AppColors.primary,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        hintText: hint,
        hintStyle: TextStyle(
          color: hintColorStyle
        ),
        labelText: label,
        prefixIcon: Icon(
            preIcon,
            color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(
            icon,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}