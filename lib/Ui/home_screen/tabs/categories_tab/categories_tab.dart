import 'package:ecommerce/Ui/home_screen/tabs/categories_tab/Products_screen.dart';
import 'package:ecommerce/core/providers/home_provider.dart';
import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key});

  final List<Map<String, String>> categories = [
    {"name": "t_shirt", "image": "assets/images/t-shrit.jpg"},
    {"name": "shirt", "image": "assets/images/shirt.jpg"},
    {"name": "pants", "image": "assets/images/pants.jpg"},
    {"name": "jacket", "image": "assets/images/jacket.jpg"},
    {"name": "outfit", "image": "assets/images/outfit.jpg"},
    {"name": "shoes", "image": "assets/images/shoes.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          AppLocalizations.of(context)!.categories,
          style: AppStyles.body14MediumBlack,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            context.read<HomeProvider>().changeIndex(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.h),
        child: Column(
          children: [
            CustomTextField(
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: AppStyles.menuItemStyle,
              borderColor: AppColors.gray300,
              suffixIcon: Icon(
                Icons.format_align_center_outlined,
                color: AppColors.grayColor,
                size: 30.sp,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.grayColor,
                size: 30.sp,
              ),
              borderSize: 1.0,
            ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(
                          categoryName: category["name"] ?? "",
                        ),
                      ),
                    );
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
