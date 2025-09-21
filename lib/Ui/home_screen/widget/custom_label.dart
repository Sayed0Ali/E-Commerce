import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  final bool isRequired;

  const CustomLabel({
    super.key,
    required this.text,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppStyles.body14MediumBlack.copyWith(
          color: AppColors.blackColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: TextStyle(
                color: AppColors.redColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
