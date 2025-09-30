import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountCard extends StatelessWidget {
  final String image;
  final String discountText;

  const DiscountCard({
    super.key,
    required this.image,
    required this.discountText,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
    
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.whiteColor, width: 8.w),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r),
    
        child: Stack(
          children: [
          
            Image.asset(
                image
                ,
              fit: BoxFit.cover,
              width: 109.w,
              height: 114.h,
            ),
    
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                 discountText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
