import 'package:ecommerce/Ui/home_screen/widget/custom_elevated_button.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routs.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassordSuccessCreated extends StatelessWidget {
  const PassordSuccessCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.h),
            Container(
              height: 408.h,
              width: 328.w,
              decoration: BoxDecoration(
                color: AppColors.lightPrimary,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Image.asset(AppAssets.passSuccess),
            ),
            SizedBox(height: 25.h),
            Text(
              AppLocalizations.of(context)!.new_password_set,
              style: AppStyles.heading24BoldBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h),
            Text(
              AppLocalizations.of(context)!.new_password_success_message,
              style: AppStyles.reguler14Gray,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.h),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.login,
              onButtonClicked: () {
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  AppRoutes.loginRoute,
                  (route) => false, // Remove all previous routes
                );
              },
              backGroundColor: AppColors.blackColor,
              textStyle: AppStyles.userNameWhite,
            ),
          ],
        ),
      ),
    );
  }
}
