import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/ProductsCategoryScreen.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/page_transitions.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryName;
  const ProductsScreen({super.key, required this.categoryName});

  List<Map<String, dynamic>> getProductsByCategory(String category) {
    switch (category) {
      case "t_shirt":
        return [
          {
            "name": "Cotton T-shirt",
            "price": "199 EGP",
            "image": "assets/images/t-shrit.jpg",
          },
          {
            "name": "Sport T-shirt",
            "price": "299 EGP",
            "image": "assets/images/t-shrit.jpg",
          },
          {
            "name": "Casual T-shirt",
            "price": "249 EGP",
            "image": "assets/images/t-shrit.jpg",
          },
        ];
      case "shirt":
        return [
          {
            "name": "Formal Shirt",
            "price": "399 EGP",
            "image": "assets/images/shirt.jpg",
          },
          {
            "name": "Casual Shirt",
            "price": "349 EGP",
            "image": "assets/images/shirt.jpg",
          },
          {
            "name": "Office Shirt",
            "price": "449 EGP",
            "image": "assets/images/shirt.jpg",
          },
        ];
      case "pants":
        return [
          {
            "name": "Jeans",
            "price": "499 EGP",
            "image": "assets/images/pants.jpg",
          },
          {
            "name": "Cargo Pants",
            "price": "399 EGP",
            "image": "assets/images/pants.jpg",
          },
          {
            "name": "Formal Pants",
            "price": "449 EGP",
            "image": "assets/images/pants.jpg",
          },
        ];
      case "jacket":
        return [
          {
            "name": "Winter Jacket",
            "price": "899 EGP",
            "image": "assets/images/jacket.jpg",
          },
          {
            "name": "Leather Jacket",
            "price": "1299 EGP",
            "image": "assets/images/jacket.jpg",
          },
          {
            "name": "Sport Jacket",
            "price": "699 EGP",
            "image": "assets/images/jacket.jpg",
          },
        ];
      case "outfit":
        return [
          {
            "name": "Casual Outfit",
            "price": "999 EGP",
            "image": "assets/images/outfit.jpg",
          },
          {
            "name": "Sport Outfit",
            "price": "899 EGP",
            "image": "assets/images/outfit.jpg",
          },
          {
            "name": "Summer Outfit",
            "price": "799 EGP",
            "image": "assets/images/outfit.jpg",
          },
        ];
      case "shoes":
        return [
          {
            "name": "Sport Shoes",
            "price": "699 EGP",
            "image": "assets/images/shoes.jpg",
          },
          {
            "name": "Casual Shoes",
            "price": "599 EGP",
            "image": "assets/images/shoes.jpg",
          },
          {
            "name": "Formal Shoes",
            "price": "799 EGP",
            "image": "assets/images/shoes.jpg",
          },
        ];
      case "flash_sale":
       return [
          {
            "name": "Sport Shoes",
            "price": "699 EGP",
            "image": "assets/images/shoes.jpg",
          },
             {
            "name": "Summer Outfit",
            "price": "799 EGP",
            "image": "assets/images/outfit.jpg",
          }, {
            "name": "Sport Jacket",
            "price": "699 EGP",
            "image": "assets/images/jacket.jpg",
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = getProductsByCategory(categoryName);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(categoryName, style: AppStyles.body14MediumBlack),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.3,
            crossAxisSpacing: 8.w,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return InkWell(
              onTap: () {
                PageTransitions.navigateWithSlide(
                  context,
                  ProductsCategoryScreen(
                    categoryName: categoryName,
                    products: products,
                  ),
                  animationType: AnimationType.slide,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.r),
                        child: Image.asset(
                          product["image"],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product["name"],
                              style: AppStyles.body14MediumBlack,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
