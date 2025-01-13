import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr/core/utils/app_colors.dart';

//one object of googleFonts instead of repute the .poppins

//(_)private as used here only
TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.poppins(
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

//bold style
TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize = 24,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

//regular style
TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize = 32,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );