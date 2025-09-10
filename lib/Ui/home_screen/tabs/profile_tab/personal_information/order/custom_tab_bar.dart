import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.gray300,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.transparentColor,
        splashBorderRadius: BorderRadius.circular(12.r),
        labelColor: AppColors.whiteColor,
        unselectedLabelColor: AppColors.blackColor,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: "Ongoing"),
          Tab(text: "Completed"),
        ],
      ),
    );
  }
}
