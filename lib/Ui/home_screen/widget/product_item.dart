import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatefulWidget {
  String image ;
  String title ;
ProductTabItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<ProductTabItem> createState() => _ProductTabItemState();
}

class _ProductTabItemState extends State<ProductTabItem> {
   bool isFav = false;

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
                child: Image.asset(
                 widget.image, 
                  width: 160.w,
                  height: 138.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: () => setState(() => isFav = !isFav),
                  child: CircleAvatar(
                    backgroundColor: AppColors.blackColor,
                    radius: 14.r,
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border_rounded,
                      color: AppColors.whiteColor,
                    ),
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
                AutoSizeText(
                  widget.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text("\$250", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text(
                  "300",
                  style: TextStyle(
                    fontSize: 14,
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
