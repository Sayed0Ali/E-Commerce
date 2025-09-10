import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductTile extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double price;
  final int quantity;
  final String? state;
  final bool isComplete;

  const CartProductTile({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.price,
    required this.quantity,
    this.state,
    this.isComplete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6.h, left: 4.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: isComplete ? AppColors.primaryColor : AppColors.redColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            isComplete ? 'Finished' : 'Estimated time: ${state ?? ''}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  imageAsset,
                  width: 120.w,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, e, st) => Container(
                    width: 90.w,
                    height: double.infinity,
                    color: AppColors.gray300,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '\$${(price * 1.3).toStringAsFixed(2)}',

                      style: TextStyle(
                        fontSize: 10.sp,
                        decoration: TextDecoration.lineThrough,

                        fontWeight: FontWeight.w600,
                        color: AppColors.gray500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'x$quantity',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
