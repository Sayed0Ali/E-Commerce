import 'package:ecommerce/Ui/home_screen/tabs/my_cart_tab/my_cart_tab.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListProduct extends StatelessWidget {
  const WishListProduct({
    super.key,
    required this.onRemove,
    required this.product,
  });

  final VoidCallback? onRemove;
  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Container(
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
                product.imageAsset,
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4.h),

                    /// السعر والخصم
                    Column(
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '\$450',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray500,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.gray300),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.remove,
                                size: 18.sp,
                                color: AppColors.gray300,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gray300,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Icon(
                                Icons.add,
                                size: 18.sp,
                                color: AppColors.gray300,
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: onRemove,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Icon(
                              Icons.delete_forever_outlined,
                              color: AppColors.redColor,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
