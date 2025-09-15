
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandScreen extends StatelessWidget {
   BrandScreen({super.key});

  final List<Map<String, String>> categories = [
    {"name": "T-shirt", "image": "assets/images/t-shrit.jpg"},
    {"name": "Shirt", "image": "assets/images/shirt.jpg"},
    {"name": "Pants", "image": "assets/images/pants.jpg"},
    {"name": "Jacket", "image": "assets/images/jacket.jpg"},
    {"name": "Outfit", "image": "assets/images/outfit.jpg"},
    {"name": "Shoes", "image": "assets/images/shoes.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(AppLocalizations.of(context)!.brands,style:AppStyles.body14MediumBlack),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.h),
        child: Column(
          children: [
           
            SizedBox(height: 16.h),

          
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true, 
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2, 
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   AppRoutes.productDetails,
                    //   arguments: category,
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.w),
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.gray300, width: 1.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100.h,
                          child: Image.asset(
                            category["image"] ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Flexible(
                          child: Text(
                            category["name"] ?? "",
                            style: AppStyles.labelStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
