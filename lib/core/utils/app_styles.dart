import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle headline24BoldJakarta = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static TextStyle body14Regulargray = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.grayColor, // أو أي لون مناسب
  );
  static TextStyle body14RegularPrimary = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.primaryColor, // أو أي لون مناسب
  );
  static TextStyle body14MediumJakarta = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle hint12RegularJakarta = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor,
  );
  static TextStyle semiBold14Jakarta = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.whiteColor, // غير اللون حسب الحاجة
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
}
