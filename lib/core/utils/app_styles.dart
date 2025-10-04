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

  static TextStyle hint12RegularText = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor,
  );

  static TextStyle labelStyle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static TextStyle emailWhite = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle userNameWhite = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle menuItemStyle = GoogleFonts.plusJakartaSans(
    fontSize: 14,
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
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle medium14Praimary = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static final TextStyle body16black = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
  );

  static final TextStyle reguler14Gray = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    color: AppColors.gray500,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle body14SemiBoldBlack = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static final TextStyle body14SemiBoldWhite = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  static final TextStyle bold24Jakarta = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static final TextStyle body16MediumBlack = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  ///////////////////////////////

  static TextStyle body12RegularBlack = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.blackColor,
    height: 1.0, // line-height 100%
    letterSpacing: 0.06, // 0.5% of 12px
  );
  static TextStyle body14MediumBlack = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.blackColor,
    height: 1.5, // line-height 150%
    letterSpacing: 0.07, // 0.5% of 14px
  );

  static TextStyle body12SemiBoldBlack = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.blackColor,
    height: 1.0, // line-height 100%
    letterSpacing: 0.06, // 0.5% of 12px
  );
  static TextStyle body10RegularLineThrough = GoogleFonts.plusJakartaSans(
    fontSize: 10,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.gray300,
    height: 1.0, // line-height 100%
    letterSpacing: 0.15, // 1.5% of 10px
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle heading18Bold = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor, // غيّر اللون لو تحب
    height: 1.0,
    letterSpacing: 0.045, // 0.25% of 18px ≈ 0.045
    // مفيش هن
    //ا خاصية text-
  );
  static TextStyle grey14RegularLineThrough = GoogleFonts.plusJakartaSans(
    fontSize: 14, // استخدم 14.0 لو مش بتستخدم ScreenUtil
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.gray500, // غيّر اللون لو عندك قيمة أخرى
    height: 1.5, // line-height: 150%
    letterSpacing: 0.07, // 0.5% of 14px = 0.07
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle smallSemiBold = GoogleFonts.plusJakartaSans(
    fontSize: 10, // استخدم 10.0 لو مش بتستخدم ScreenUtil
    fontWeight: FontWeight.w600,
    height: 1.0, // line-height: 100%
    letterSpacing: 0.15, // 1.5% of 10px = 0.15
    color: AppColors.blackColor, // اضف اللون اللي تريده هنا
  );
  static TextStyle body14Regular150 = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.07,
    color: AppColors.gray500,
  );
  static TextStyle body12SemiBold100 = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.06,
    color: AppColors.blackColor,
  );
}
