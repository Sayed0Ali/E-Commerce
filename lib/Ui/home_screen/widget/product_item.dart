import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatelessWidget {
  const ProductTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  "https://picsum.photos/800/400?random=2", // صورة وهمية
                  width: 160.w,
                  height: 138.h,
                  fit: BoxFit.cover,
                ),
              ),
              // أيقونة favorite
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: AppColors.blackColor,
                  radius: 14.r,
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const Text(
                  "Product Title",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text("\$250", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text(
                  "300",
                  style: TextStyle(
                    fontSize: 11,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
