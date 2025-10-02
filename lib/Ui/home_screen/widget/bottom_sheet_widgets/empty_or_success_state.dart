import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyOrSuccessState extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Widget? actionButton;

  const EmptyOrSuccessState({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 24.h),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                color: AppColors.gray500,
              ),
            ),
          ),
          if (actionButton != null) ...[
            SizedBox(height: 24.h),
            actionButton!,
          ],
        ],
      ),
    );
  }
}