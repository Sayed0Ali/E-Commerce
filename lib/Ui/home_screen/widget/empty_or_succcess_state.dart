import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyOrSuccessState extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;

  const EmptyOrSuccessState({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.h),
          Image.asset(imagePath),
          SizedBox(height: 25.h),
          Text(
            title,
            style: AppStyles.headline24BoldJakarta,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15.h),
          Text(
            subtitle,
            style: AppStyles.body14Regulargray,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          CustomElevatedButton(
            text: buttonText,
            onButtonClicked: () {
              Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
            },
            backGroundColor: AppColors.blackColor,
            textStyle: AppStyles.userNameWhite,
          ),
        ],
      ),
    );
  }
}
