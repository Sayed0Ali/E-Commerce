import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle regular12Text = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  static TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  // static TextStyle light14SearchHint = GoogleFonts.poppins(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w300,
  //   color: AppColors.searchHintColor,
  // );

  static TextStyle light16White = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.whiteColor,
  );

  static TextStyle light18HintText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.hintTextColor,
  );

  static const TextStyle medium18HeadLine = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  //==========================================================

  static TextStyle body14MediumBlack = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle hint12RegularText = GoogleFonts.plusJakartaSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor,
  );

  static TextStyle labelStyle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static TextStyle emailWhite = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle userNameWhite = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle menuItemStyle = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.grayColor,
  );

  static TextStyle bold18Jakarta = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w700, // 700 = Bold
    color: AppColors.blackColor,
  );
  static TextStyle semiBold14 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.primaryColor,
  );
  //=======================================================================================================================================

  static final TextStyle heading24BoldBlack = GoogleFonts.plusJakartaSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle medium14Praimary = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static final TextStyle body16black = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
  );

  static final TextStyle reguler14Gray = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    color: AppColors.gray500,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle body14SemiBoldBlack = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static final TextStyle body14SemiBoldWhite = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static final TextStyle bold24Jakarta = GoogleFonts.plusJakartaSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static final TextStyle body16MediumBlack = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}
