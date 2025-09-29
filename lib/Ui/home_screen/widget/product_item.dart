import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/page_transitions.dart';
import 'package:ecommerce/core/providers/favorites_provider.dart';
import 'package:ecommerce/Ui/home_screen/tabs/product_details/product_details.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductTabItem extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String oldPrice;
  final List<Color> colors;
  final String colorsCount;

  const ProductTabItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.colors,
    required this.colorsCount,
  });

  @override
  State<ProductTabItem> createState() => _ProductTabItemState();
}

class _ProductTabItemState extends State<ProductTabItem> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return GestureDetector(
      onTap: () {
        PageTransitions.navigateWithSlide(
          context,
          ProductDetails(
            image: widget.image,
            title: widget.title,
            price: widget.price,
            oldPrice: widget.oldPrice,
            colors: widget.colors,
            description: 'High quality product with excellent features.',
          ),
          animationType: AnimationType.slide,
        );
      },
      child: Container(
        width: 160.w,
        height: 227.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset(
                    widget.image,
                    width: 160.w,
                    height: 138.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: InkWell(
                    onTap: () {
                      favoritesProvider.toggleFavorite(
                        id: widget.title, // Using title as ID for now
                        title: widget.title,
                        imageAsset: widget.image,
                        price: double.parse(widget.price.replaceAll('\$', '')),
                        oldPrice: double.parse(
                          widget.oldPrice.replaceAll('\$', ''),
                        ),
                        colors: widget.colors,
                        colorsCount: widget.colorsCount,
                      );
                    },
                    child: Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        favoritesProvider.isFavorite(widget.title)
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: favoritesProvider.isFavorite(widget.title)
                            ? AppColors.redColor
                            : AppColors.whiteColor,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colors row
                  Row(
                    children: [
                      ...List.generate(
                        widget.colors.length > 3 ? 3 : widget.colors.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Container(
                            width: 16.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: widget.colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.colors.length > 3)
                        Text(
                          widget.colorsCount,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  // Title
                  Text(
                    widget.title,
                    style:AppStyles.body14MediumBlack,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  // Prices
                  Column(
                    children: [
                      Text(
                        '\$ ${widget.price}',
                      style: AppStyles.body12SemiBoldBlack ,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                      '\$ ${  widget.oldPrice}',
                        style:AppStyles.body10RegularLineThrough
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
