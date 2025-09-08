import 'package:ecommerce/Ui/home_screen/widget/custom_text_field.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(AppLocalizations.of(context)!.search),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 30.w),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
          },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(12.h),
        child: SingleChildScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}